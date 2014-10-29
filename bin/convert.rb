# Load dependency
require './lib/convert/convert'
require 'json'
begin
	arguments = JSON.parse(File.open("arguments.json", "r").read)
	ARGV.each do |data|
		fileInputPath = data.to_s
		fileInputBase = File.basename(fileInputPath)
		converter(fileInputPath, fileInputBase, arguments)
	end
rescue
	puts "Error: #{$!}"
end
