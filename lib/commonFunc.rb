require 'zhconv'
require 'json'
require 'pp'

def deep_copy(source)
  return Marshal.load(Marshal.dump(source))
end

def zhTWConverter(str)
  return ZhConv.convert('zh-tw', str)
end
