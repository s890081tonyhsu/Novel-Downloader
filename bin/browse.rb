# Load dependency
require './lib/browse/browse'
require 'json'
def menu(page, browser, data)
	case page
	when -1
		puts "\n======================"
		puts "1. get novel by id"
		puts "2. download novel by id"
		puts "3. get novel by browsing yourself"
		puts "4. download novel by browsing yourself"
		puts "0. Exit"
		print "Input your number: "
	when 1
		puts "\n======================"
		print "Input novel number: "
		novel_id = gets.chomp
		browse_novel_id(browser, novel_id)
		get_novel_data(browser)
		print "Do you want to download it(y/n)? "
		case gets.strip
		when "y", "Y"
			download_novel(browser, novel_id, data)
		end
	when 2
		puts "\n======================"
		print "Input novel number: "
		novel_id = gets.chomp
		download_novel(browser, novel_id, data)
	when 3
		puts "\n======================"
		puts "Use your browser to get the novel, then press enter..."
		gets
		browse_novel_id(browser, novel_id)
		get_novel_data(browser)
		case gets.strip
		when "y", "Y"
			download_novel(browser, novel_id, data)
		end
	when 4
		puts "\n======================"
		puts "Use your browser to get the novel, then press enter..."
		gets
		download_novel(browser, novel_id, data)
	end
end

begin
	arguments = JSON.parse(File.open("arguments.json", "r").read)
	puts "Welcome to sfacg command line prompt mode"
	puts "System will launch a browser for you"
	browser = init_Browser_ff(arguments)
	page = -1
	while page != 0
		menu(page, browser, arguments)
		page = gets.chomp.to_i
		unless page.between?(0, 4)
			page = -1
		end
	end
rescue
	puts "Error: #{$!}"
end

browser.quit
