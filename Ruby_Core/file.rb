File.open("example.txt", "a+") do |file|
    puts "Enter your name: "
    name = gets.chomp
    puts "Enter your email: "
    email = gets.chomp
    file.puts "Name: #{name}" + "\n" + "Email: #{email}"
end