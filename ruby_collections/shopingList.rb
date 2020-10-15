# Create new list return hash with name of list and Array with items 
def create_list
    puts "What is a list name? "
    name = gets.chomp

    hash = { "name" => name, "items" => Array.new }
    return hash
end


# Adding new item to the list (return hash with one item)
def add_new_items_to_list
    puts "What is a item called "
    item_name = gets.chomp

    print "How much? "
    quantity = gets.chomp.to_i

    hash = { "name" => item_name, "quantity" => quantity }
    return hash
end

# Output info on screen from any list that you put as argument
def print_list(list)
    puts "List name: #{list['name']}"
    print_separator()
    
    list['items'].each do |item|
        puts "\t\t\tItem: " + item['name'] + "\t\t\tQuantity: " + item['quantity'].to_s
    end
    ``
    print_separator()
end

# Sepatator for list items
def print_separator(character = "-")
    puts character * 80
end

#Main program circle
list = create_list()
puts list

list['items'].push(add_new_items_to_list())
list['items'].push(add_new_items_to_list())


print_list(list)