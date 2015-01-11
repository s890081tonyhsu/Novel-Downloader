require './lib/commonFunc.rb'
require './lib/crawer.rb'
require './lib/novelBook.rb'

@setting = JSON.parse(File.open('./setting.json').read)

def download_book(novelID, indexPath)
  @websiteURL = deep_copy(@setting[@setting['default']['source']])
  @novelCrawer = NovelCrawer.new(novelID, @websiteURL)
  @novelBook = NovelBook.new(@novelCrawer, novelID)
  @novelBook.globChapters
  @novelBook.globSub
end


begin
  @novelID = ARGV[0]
  raise 'No novel ID...'
  @indexPath = ARGV[1] || @setting['default']['folder']
  download_book(@novelID, @indexPath)
rescue
	puts 'Fatal Error'
end

