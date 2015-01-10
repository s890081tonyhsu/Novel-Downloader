require './lib/commonFunc.rb'
require 'open-uri'
require 'nokogiri'

class NovelCrawer
	def initialize(novelID, websiteParams)
    @novelLinks = deep_copy(websiteParams)
    @novelLinks.each do |link|
      link[1].gsub!(/\{novelID\}/, novelID)
    end
    puts websiteParams
  end

  def get_novel_cover(show = false)
    @request = open(URI.join(@novelLinks['base'], @novelLinks['cover']).to_s)
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
    @request = open(URI.join(@novelLinks['base'], @novelLinks['index']).to_s)
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
          novelIndex[indexTemp['num']] = deep_copy(indexTemp)
          indexTemp = {}
        else
          next
        end
      end
    end
    return novelIndex
  end

  def get_novel_chapter(chapter)
    content = ''
    content << '## '+chapter['name']
    content << "\n"
    if chapter['sub'].length != 0
      chapter['sub'].each do |sub|
        content << self.get_novel_sub(chapter['num'], sub['num'])
      end
    end
  end

  def get_novel_sub(chapterID, subID)
    baseURL = deep_copy(@novelLinks['base'] + @novelLinks['sub']).gsub!(/\{chapterID\}/, chapterID)
    customLink = URI.join(@novelLinks['base'], deep_copy(baseURL).gsub!(/\{subID\}/, subID))
    content = ''
    @request = open(customLink)
    @data = Nokogiri::HTML(@request)
    content << '### '+@data.search('.list_menu_title').text.match(/\xE3\x80\x90.*\xE3\x80\x91(.*)/)[1]
    content << "\n"
    @data.search('#ChapterBody').children.each do |line|
      if line.name == 'img'
        src = URI.join(@novelLinks['base'], line.attributes['src'].value).to_s
        alt = line.attributes['alt'].value.to_s
        content << '!['+alt+']('+src+')'
        content << "  \n"
      else
        content << "\xE2\x80\x83\xE2\x80\x83"+line.text
        content << "  \n"
      end
    end
    return content
  end
end
