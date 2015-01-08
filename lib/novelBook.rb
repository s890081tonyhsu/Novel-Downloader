require './lib/commonFunc.rb'
require 'fileutils'

class NovelBook
  def initialize(novelCrawer, novelID)
    @crawer = novelCrawer
    @path = './novelData/'+novelID
    if(Dir.exist?(@path) && File.exist?(@path+'/cover.json') && File.exist?(@path+'/index.json'))
      self.updateCheck
    else
      self.newBook
    end
  end

  def updateCheck
    current = JSON.parse(File.open(@path+'/cover.json').read)
    last = @crawer.get_novel_cover
    if (Time.parse(current['update']) < Time.parse(last['update']))
      puts 'Download lastest novel index...'
      File.open(@path+'/cover.json', 'w') do |f|
        f.write(JSON.pretty_generate(last))
      end
      File.open(@path+'/index.json', 'w') do |f|
        f.write(JSON.pretty_generate(@crawer.get_novel_index))
      end
    end
  end

  def newBook
    FileUtils.mkdir_p(@path)
    File.open(@path+'/cover.json', 'w') do |f|
      f.write(JSON.pretty_generate(@crawer.get_novel_cover(true)))
    end
    File.open(@path+'/index.json', 'w') do |f|
      f.write(JSON.pretty_generate(@crawer.get_novel_index))
    end
  end

  def globChapters
    chapters = JSON.parse(File.open(@path+'/index.json').read)
    chapters.each_pair do |key, chapter|
      if !key.empty?
        FileUtils.mkdir_p(@path+'/'+key)
      end
    end
  end

  def globSub 
    chapters = JSON.parse(File.open(@path+'/index.json').read)
    chapters.each_pair do |key, chapter|
      if chapter['sub'].length != 0
        chapter['sub'].each do |sub|
          filepath = @path+'/'+chapter['num']+'/'+sub['num']+'.md'
          unless (File.exist?(filepath))
            @data = @crawer.get_novel_sub(chapter['num'], sub['num'])
            File.open(filepath, 'w') do |f|
              f.write(@data)
            end
          end
        end
      end
    end
  end
end
        
