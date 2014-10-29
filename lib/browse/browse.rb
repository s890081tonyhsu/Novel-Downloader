require 'selenium-webdriver'
require 'zhconv'
require 'json'
require 'memoize'
include Memoize

$url_List = {
	"home" => "http://www.sfacg.com",
	"login" => "http://passport.sfacg.com",
	"book" => "http://book.sfacg.com"
}
def load_data
	return JSON.parse(File.open("arguments.json", "r").read)
end

def init_Browser_ff(data)
	Selenium::WebDriver::Firefox::Binary.path = data["firefox"]["binary"]
	profile = Selenium::WebDriver::Firefox::Profile.new
	download_path = Dir.pwd + "/downloaded"
	profile['browser.download.dir'] = download_path.gsub("/", "\\")
	profile['browser.download.folderList'] = 2
	profile['browser.helperApps.neverAsk.saveToDisk'] = "text/plain"
	profile["browser.altClickSave"] = true
	
	driver = Selenium::WebDriver.for :firefox, :profile => profile
	return driver	
end

def get_text_excluding_children(driver, element)
  return driver.execute_script("""
    return jQuery(arguments[0]).contents().filter(function() {
      return this.nodeType == Node.TEXT_NODE;
    }).text();
  """, element)
end


def loginToPage(browser, data)
	# check login
	# if not, login it
	last = browser.current_url
  	browser.navigate.to $url_List["login"]
 	account_input = browser.find_element(:name => "ctl00$ContentMain$PL$_$PassportName")
 	account_input.click
	account_input.send_keys(data["login"]["account"])

	password_input = browser.find_element(:name => "ctl00$ContentMain$PL$_$Password")
	password_input.click
	password_input.send_keys(data["login"]["password"])

	browser.find_element(:id => "ctl00_ContentMain_PL___TryLogin").click
	browser.find_element(:class => "redfont_input").click
	browser.navigate.to last
end
memoize :loginToPage

def browse_novel_id(browser, id)
	link = $url_List["book"] + "/Novel/" + id
	browser.navigate.to link
end

def get_novel_data(browser)
	begin
		
		# Go to Novel Page to get cover
		
		id = browser.current_url.scan(/\/(\d+)/)[0][0].to_i
		title = browser.find_element(:tag_name => "h1").text
		puts "Title: " + ZhConv.convert("zh-tw", title)
		words = browser.find_elements(:tag_name => "span")[8].text.to_i
		puts "Words: " + words.to_s
		update = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2})/.match(browser.execute_script("return $('span')[8].parentElement.innerHTML"))[0].to_s
		puts "Last update: " + update

		# Go to MainIndex to get the chapter

		link = browser.current_url + "/MainIndex"
		number = Array.new
		title = Array.new
		browser.navigate.to link
		puts "Chapters: "
		data = browser.find_elements(:css => "volumeitem li:first-child > a")
		data.each do |ch|
			number.push(ch.attribute("href").to_s.scan(/\/(\d+)/)[1][0].to_i)
		end
		data = browser.find_elements(:css => ".list_menu_title span:nth-child(odd)")
		data.each do |ch|
			title.push(ZhConv.convert("zh-tw", get_text_excluding_children(browser, ch).split(' ', 2)[1]))
		end
		chapters = Hash[number.zip title]
		chapters.each do |number, title|
			puts number.to_s + " * " + title
		end
		
	rescue
		puts "cannot get the novel"
	end
end


def download_novel_book(browser, id, book, data)
	loginToPage(browser, data)
	link = $url_List["book"] + "/txt/" + id + "/" + book + ".txt"
	path = ('./downloaded/' + id).chomp
	txt = browser.execute_script("return $.ajax({url: arguments[0], async: false}).responseText", link)
	unless File.directory?(path)
		FileUtils.mkdir_p(path)
	end

	File.open('./downloaded/' + id + '/' + book + '.txt', 'w'){|f| f.write(txt)}
end

def download_novel(browser, id, data)
	loginToPage(browser, data)
	link = $url_List["book"] + "/Novel/" + id + "/MainIndex"
	browser.navigate.to link
	detail = browser.find_elements(:css => "volumeitem li:first-child > a")
	detail.each do |ch|
		book = ch.attribute("href").to_s.scan(/\/(\d+)/)[1][0]
		download_novel_book(browser, id, book, data)
	end
end
	
