module Emojipicker
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end

require "option_parser"
require "./list"

print_list = [] of String

OptionParser.parse! do |parser|
  parser.banner = "usage: emoji [options] [names]"
  parser.on("-h", "--help", "display this help") { puts parser; exit }

  parser.unknown_args do |args|
    args.each do |arg|
      print_list << arg
    end
  end
end

list = print_list.map do |name|
  EMOJIS[name]?
end

list = list.compact

list.each do |emoji|
  print emoji
end

unless list.empty?
  puts
end
