def page_content(title)
    File.read("#{title}.txt")
rescue Errno::ENOENT
    return nil
end

puts "Hello"
puts page_content("Andrei Komolov")