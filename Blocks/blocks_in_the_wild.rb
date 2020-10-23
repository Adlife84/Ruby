# String#each_char:
string = "Treehouse"
string.each_char{ |c| print "#{c}-" }

company = string.each_char{ |c| print "#{c}-" }

puts company


# String#each_line:
haiku = <<-EOF
A string with three lines
Is considered multi line
Ruby code haiku
EOF

haiku.each_line{ |line| puts "* #{line}" }


# Integer#down_to:
5.downto(0) { |number| print number }