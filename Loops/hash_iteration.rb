# Hash with date 
business = { "name" => "Treehouse", "location" => "Portland, OR" }

# .each method that is iterating all items with "key" and "value"
business.each do | key, value |
    puts "That hash has key is #{key} and the value is #{value}"
end

# .each method that is iteratinng all items with "key" only
business.each_key do | key |
    puts "Key: #{key}"
end

# .each method that is iteratinng all items with "value" only
business.each_value do | value |
    puts "Value: #{value}"
end
