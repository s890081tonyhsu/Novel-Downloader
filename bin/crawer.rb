require './lib/commonFunc.rb'
require './lib/crawer.rb'
require './lib/novelBook.rb'

@setting = JSON.parse(File.open('./setting.json').read)

print 'Input a novel ID: '
while input = gets do
  if input.to_i == 0
    puts 'Not number...'
    next
  else
    @novelID = input.chomp
    @websiteURL = deep_copy(@setting[@setting['default']])
    puts 'ID: '+@novelID
    @novelCrawer = NovelCrawer.new(@novelID, @websiteURL)
    @novelBook = NovelBook.new(@novelCrawer, @novelID)
    @novelBook.globChapters
    @novelBook.globSub
  end
  print 'Input a novel ID: '
end
  
