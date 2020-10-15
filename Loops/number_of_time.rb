def print_something_number_of_time (string, times)
    i = 0
    while i < times 
        print string
        i += 1
    end
end



answer = 0

while answer < 5
    puts "How many time do you want print 'Hello'? (Enter a number greater  than 5 to exit"
    answer = gets.chomp.to_i
    print_something_number_of_time("Hello\n", answer)
end
