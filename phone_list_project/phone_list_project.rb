# Set up a Contact list array
contact_list = []

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
end

# Output a list of contacts on the srceen
def output_list
    puts contact_list
end


# Main start program
answer = ""
while answer != "n"
    contact_list.push(add_contact())
end