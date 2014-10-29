def novel_prefix(novel)
	return novel.values
end

def converter(fileInputPath, fileInputBase, data)
	begin
		if  Dir.glob(fileInputPath).empty?
			raise "cannot find file"
		end
		system("#{data["converter"]["path"].gsub('/', '\\')} #{converter["path"]} #{fileInputPath.gsub('/', '\\')} .\\converted\\#{fileInputBase}")
		data = Dir.glob("./converted/" + fileInputBase)
		example = novel_prefix(data["novel"])
		data.each do |path|
			file = File.open(path, "r")
			if !file
				raise "convertion failed because there's no output file"
			end
			name = Array.new
			while name.length < 2
				line = file.gets.gsub(/\n$/,"")
				if (line.include? example[(name.length + 1)])
					line.slice! example[name.length + 1]
					name.push(line)
				end
			end
			name = name.join(" ") + ".txt"
			file.close
			File.rename(path, "./converted/" + name)
		end
	rescue
		puts "Error: #{$!}"
	end
end

