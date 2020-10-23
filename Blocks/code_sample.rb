# Code samples

def separator(char = "-", int = 45)
    puts "#{char}" * int
end

separator()

# Create an array
array = [1, 2, 3]

# Use each method to print items out 
array.each { |item| print "-#{item}-" } # -1--2--3- 

# Array.select (return new array with result)
array.select { |item| item > 2} # [3]

# Array#delete_if
array.delete_if { |item| item == 1 } # [2,3]

# Array #reject
array.reject { |item| item % 3 == 0 } # [1,2]

# Array#count
array.count # 3
array.count { |item| item % 3 ==0 } # 1

# Hashes

puts hash = { 'name' => 'Jason', 'location' => 'Treehouse' }

# Hach.each
hash.each do |key, value|
    puts "key: #{key} value: #{value}"
end


# key: name  value: Jason 
# key: location value: Threehouse
separator()


# Hash each key
puts hash.each_key { |key| puts "key: #{key}" } 
# key: name
# key: location

separator()

# Hash each value
puts hash.each_value { |value| puts "value: #{value}" }
# value: Jason
# value: Treehouse

separator()

# Hash keep_if
puts hash.keep_if { |key, val| key == "name" }
# The hash is now: { 'name' = > 'Jason' }

separator()

# Hash reject
puts hash.reject { |key, val| key == "name" }
# The hash is now: {}

separator()

# Hash select
puts hash.select { |key, val| key == "name" }
# returns a new hash: { 'name' => 'Jason' }

separator()