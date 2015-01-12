require './lib/commonFunc.rb'

@inputPath = ARGV[2]
@outputPath = ARGV[3] + File.basename(ARGV[2])
@lang = 'zh-tw'
@lang = 'zh-cn' if ARGV[1] == 'zhcn'

begin
	input = File.open(@inputPath, 'r').read
	output = File.open(@outputPath, 'w')
	input.gsub!(/(\r|\n)+/, "\n")
	input.each_line do |line|
		output.write(ZhConv.convert(@lang, line))
	end
rescue
	put 'Error'
end
