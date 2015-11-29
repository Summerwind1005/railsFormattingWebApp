#!/usr/bin/env ruby

require 'fileutils'

FileUtils.mkpath 'tmp'

filename = 'tmp/' + ARGV[0]
content = File.read filename

content = content.gsub '>', ">\n"
content = content.gsub /(?!^)<\//, "\n</"

content_arr = content.split "\n"

indention = 2

content_arr.each do |tag|
  if content_arr.index(tag) != 0
    if tag.match(/^<[a-zA-Z0-9]/)
      indention.times do
        tag.insert(0, ' ')
      end
      indention+=2
    elsif tag.match(/^[a-zA-Z0-9]/) || tag.start_with?('</')
      indention.times do
        tag.insert(0, ' ')
      end
      indention-=2
    end
  end
end

new_content = content_arr.join("\n")

result = File.new('tmp/formattedText' + File.extname(filename), 'w')

File.open(result, 'w') do |f|
  f.puts new_content
end


puts new_content