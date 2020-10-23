def get_name(prompt, &block)
    print prompt + ": "
    name = gets.chomp
    print "Your age: "
    age = gets.chomp
    yield name, age if block_given?
    name
  
  end
  
my_name = get_name("Name: ")
  
  puts "my_name: #{my_name}"
