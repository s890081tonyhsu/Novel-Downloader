require './lib/commonFunc.rb'

zhTW = false
filesource = false
input = ''

def get_novel_list(indexPath)
	list = Array.new
	Dir.foreach(indexPath) do |folder|
		novelPath = indexPath + '/' + folder
		if folder == '.' || folder == '..'
			next
		else
			if !!Dir.glob(novelPath + '/cover.json') && !!Dir.glob(novelPath + '/index.json')
				name = JSON.parse(File.open(novelPath + '/cover.json').read)['title']
				list.push({'num'=>folder, 'name'=>name})
			end
		end
	end
	return list
end

begin
	case ARGV[0]
	when 'from_json'
		filesource = true
		listname = ARGV[1] || 'list.json'
		list = JSON.parse(File.read(listname))
	when 'from_folder'
		listpath = ARGV[1] || './novelData'
		list = get_novel_list(listpath)
	else
		raise 'No functioning parameter...'
	end
	outputList = deep_copy(list)
	print 'Troditional Chinese? '
	input = $stdin.gets
	zhTW = true if input.strip.downcase == 'y'
	outputList.each do |book|
		printf "%5s", book['num']
		print " -- #{zhTWConverter(book['name'])}" if zhTW
		print " -- #{book['name']}" unless zhTW
		puts
	end
	unless filesource
		puts 'Write to file? '
		input = $stdin.gets
		if input.strip.downcase == 'y'
			File.write(listpath+'/../list.json', list.to_json)
			puts 'Writed to list.json on the front of your novelPath...'
		end
	end
rescue
	puts 'Fatal Error'
end
