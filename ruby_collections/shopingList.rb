def create_list
    puts "What is a list name? "
    name = gets.chomp

    hash = { "name" => name, "items" => Array.new }
    return hash
end


def add_new_items_to_list
    puts "What is a item called "
    item_name = gets.chomp

    print "How much? "
    quantity = gets.chomp.to_i

    hash = { "name" => item_name, "quantity" => quantity }
    return hash
end

def print_list(list)
    puts "List name: #{list['name']}"
    puts "-----"
    
    list['items'].each do |item|
        puts "Item: " + item['name']
        puts "Quantity: " + item['quantity'].to_s
        puts "-----"
    end
end

list = create_list()
puts list
puts ""

list['items'].push(add_new_items_to_list())
list['items'].push(add_new_items_to_list())
list['items'].push(add_new_items_to_list())


print_list(list)