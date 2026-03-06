#!/usr/bin/env ruby

TODO_PATH = ENV['TODO_PATH'] || File.expand_path('~/Code')

if !File.directory?(TODO_PATH)
  puts "Error: #{TODO_PATH} doest not exist or is not a directory."
  exit 1
end

files = Dir.glob("#{TODO_PATH}/**/TODO.org").map do |file|
  name = File.dirname(file).gsub("#{TODO_PATH}/", "").gsub(/\/.*/, "")
end

puts "These projects contain TODO.org files:"
puts
puts files.join("\n")
