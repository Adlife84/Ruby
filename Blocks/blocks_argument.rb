myArray = [1, 2, 3]

myArray.each do |number|
    puts number
end

def get_Name
    print "Enter your name: "
    name = gets.chomp
    yield name
end

get_Name do |your_name|
    puts "That's is a cool name, #{your_name}"
end
