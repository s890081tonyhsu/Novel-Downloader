require 'open-uri'
require 'nokogiri'
require 'zhconv'

def zhTWConverter(str)
  return ZhConv.convert('zh-tw', str)
end

class NovelCrawer
	def initialize (novelID, websiteParams)
    @novelLinks = websiteParams.clone
    @novelLinks.each do |link|
      link[1].gsub(/\{novelID\}/, novelID)
    end
  end

  def get_novel_cover(show = false)
    @request = open(@novelLinks['cover'])
    @data = Nokogiri::HTML(@request)
    novelCover = {}
    novelCover['title'] = @data.search('h1').children[0].to_s
    novelCover['image'] = URI.join(@novelLinks['base'], @data.search('li.cover > img').first.attributes['src'].value).to_s
    novelCover['update'] = Time.parse(@data.search('ul.synopsises_font > li:nth-child(2)').children[21].text)
    if show
      novelCover['introduction'] = @data.search('ul.synopsises_font > li:nth-child(2)').children[3].to_s.strip!
      novelCover['type'] = @data.search('ul.synopsises_font > li:nth-child(2)').children[8].text
      novelCover['author'] = @data.search('ul.synopsises_font > li:nth-child(2)').children[11].text
      novelCover['letters'] = @data.search('ul.synopsises_font > li:nth-child(2)').children[14].text
      novelCover['finished'] = @data.search('ul.synopsises_font > li:nth-child(2)').children[15].text
    end
    return novelCover
  end

  def get_novel_index
    @request = open(@novelLinks['index'])
    @data = Nokogiri::HTML(@request)
    novelIndex = {}
    indexTemp = {}
    list = @data.search('.plate_top').children
    list.search('.Download_box').remove
    list.each_with_index.map do |item, pos|
      if item.name == 'text'
        next
      else
        case item.attributes['class'].value.strip
        when 'list_menu_title'
          indexTemp['name'] = item.search('span')[0].text.strip
          if list[pos+2].search('a').length != 0
            indexTemp['num'] = list[pos+2].search('a')[0].attributes['href'].value.split('/')[3]
          else
            next
          end
        when 'list_Content'
          indexTemp['sub'] = Array.new
          item.search('a').each do |sub|
            subTemp = {}
            subTemp['text'] = sub.text
            subTemp['num'] = sub.attributes['href'].value.split('/')[4]
            indexTemp['sub'].push(subTemp)
          end
          novelIndex[indexTemp['num']] = indexTemp.clone
          indexTemp = {}
        else
          next
        end
      end
    end
    return novelIndex
  end

  def get_novel_chapter(chapter, title = false)
    content = ''
    if title
      content << chapter['name']
      content << "\n====\n"
    end
    if chapter['sub'].length != 0
      baseURL = @novelLinks['sub'].clone
      baseURL.gsub!(/\{chapterID\}/, chapter['num'])
      chapter['sub'].each do |sub|
        content << get_novel_sub(baseURL, sub['num'])
      end
    end
  end

  def get_novel_sub(baseURL, subID, title = false)
    customLink = baseURL.clone.gsub!(/\{subID\}/, subID)
    content = ''
    @request = open(customLink)
    @data = Nokogiri::HTML(@request)
    if title
      content << @data.search('h1').text
      content << "\n====\n\n"
    end
    content << @data.search('.list_menu_title').text
    content << "\n----\n\n"
    @data.search('#ChapterBody').children.each do |line|
      if line.name == 'img'
        src = URI.join(@novelLinks['base'], line.attributes['src'].value).to_s
        alt = line.attributes['alt'].value.to_s
        content << '!['+alt+']('+src+')'
        content << "\n"
      else
        content << line.text
        content << "\n"
      end
    end
    return content
  end
