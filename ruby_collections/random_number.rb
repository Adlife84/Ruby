random_number = Random.new.rand(5)
puts random_number

loop do
    puts "Try to guess a number from 0 to 5 (e to exit)? "
    answer = gets.chomp.downcase
    if answer == "e"
        puts "Buy buy, see you later :)"
        break
    else
        if random_number == answer.to_i
            puts "You guessed correctly"
            break
        else
            puts "Try again."
            puts "Your namber was: #{answer}"
        end
    end
end
