# Set up a Contact list array
contact_list = [ 
    { "name" => "Andrey",
        "phone_numbers" => [9195223309, 9259001540]
    },
    { "name" => "Olga",
        "phone_numbers" => [9195224758, 9259002233]
    },
    { "name" => "Matvei",
        "phone_numbers" => []
    }
]

# Ask method take a string like a question and return answer string|number
def ask (question, kind = "string")
    print question + " "
    answer = gets.chomp
    answer = answer.to_i if kind =="number"
    return answer
end

# Add contact method that use Ask method to gets a name and phone number
def add_contact
    contact = { "name" => "", "phone_numbers" => []}
    contact["name"] = ask("What is a person's name?")

    answer = ""
    while answer != "n"
        answer = ask("Do you want to add a phone number?")
        puts answer == "n"
        if answer == "y"
            phone = ask("Enter a phone number:")
            contact["phone_numbers"].push(phone)
        end 
    end
    return contact
end

# Output a list of contacts on the screen
def output_list(contact_list)
    puts "------\n"
    contact_list.each do |contact|
        puts "Name: #{contact["name"]}"
        if contact["phone_numbers"].length > 0
            contact["phone_numbers"].each do |phone_number|
            puts "Phone: #{phone_number}"
            end
        end
        puts "-----\n"
    end
end

# Main start program
answer = ""
# hash = { "name" => "Masha", "phone_numbers" => [12233, 123123]} test hash

while answer != "n"
    contact_list.push(add_contact())
    answer = ask("Add anothe? (y/n)")
end

output_list(contact_list)

