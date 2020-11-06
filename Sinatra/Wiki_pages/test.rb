listArray = ["123456.txt", "Alen Kar.txt", "Andrei Komolov.txt", "Maks Ivanov.txt", "Maks.txt", "Matvei Komolov.txt", "Olga Komolova.txt"] 

puts listArray

listArray.each_with_index do |name, index|
    listArray[index] = name.chomp(".txt") 
end

puts listArray

