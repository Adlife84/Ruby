require "./contact_class.rb"
require "yaml"

class AddressBook

    attr_reader :contacts

    def initialize
        @contacts = []
        open()
    end

    # Open file with contacts database
    def open
        if File.exist?("contacts.yml")
          @contacts = YAML.load_file("contacts.yml")
        end
    end
    
    # Save new data to file
    def save
        File.open("contacts.yml", "w") do |file|
          file.write(contacts.to_yaml)
        end
    end
    

    def run
        loop do
            puts "------------Address Book Menu-------------"
            puts "a: to Add Contact"
            puts "p: to Print Addressbook"
            puts "s: Search contact"
            puts "e: to Exit"
            puts "Enter your choice."
            input = gets.chomp.downcase
            case input
            when 'a'
                add_contact
            when 'p'
                print_contact_list
            when 's'
                puts "Search term: "
                search = gets.chomp
                find_by_name(search)
                find_by_phone_number(search)
                find_by_address(search)
            when 'e'
                save()
                break
            end
        end
    end

    def add_contact
        contact = Contact.new
        puts "What is First name?"
        contact.first_name = gets.chomp
        puts "What is Middle name?"
        contact.middle_name = gets.chomp
        puts "What is Last name?"
        contact.last_name = gets.chomp

        loop do
        puts "Add phone number or address? "
        puts "p: Add phone number"
        puts "a: Add address"
        puts "(Any key to go back)"
        
        input = gets.chomp.downcase
        
            case input
            when 'p'
                phone = PhoneNumber.new
                print "Phone number kind (Home, Work, etc): "
                phone.kind = gets.chomp
                print "Number: "
                phone.number = gets.chomp
                contact.phone_numbers.push(phone)
            when 'a'
                address = Address.new
                print "Address Kind (Home, Work, etc): "
                address.kind = gets.chomp
                print "Address line 1: "
                address.street_1 = gets.chomp
                print "Address line 2: "
                address.street_2 = gets.chomp
                print "City: "
                address.city = gets.chomp
                print "State: "
                address.state = gets.chomp
                print "Postal Code: "
                address.postal_code = gets.chomp
                contact.addresses.push(address)
            else
                print "\n"
                break
            end
        end

        @contacts.push(contact)
    end

    def find_by_name(name)
        results = []
        search = name.downcase
        contacts.each do |contact|
            if contact.full_name.downcase.include?(search)
                results.push(contact)
            end
        end
        if results == []
            puts "I have nothing with a your search request: #{search}"
            else
                puts "Name search (#{search})"
                results.each do |contact|
                    puts contact.to_s('full_name')
                    contact.print_phone_numbers
                    contact.print_addresses
            end
        end
    end

    def find_by_phone_number(number)
        results = []
        search = number.gsub("-", "") # gsub method change first argument for second one
        contacts.each do |contact|
            contact.phone_numbers.each do |phone_number|
                if phone_number.number.gsub("-", "").include?(search)
                    results.push(contact) unless results.include?(contact)
                end
            end
        end
        print_results("Phone search results (#{search}", results)
    end

    def find_by_address(query)
        results = []
        search = query.downcase
        contacts.each do |contact|
            contact.addresses.each do |address|
                if address.to_s('long').downcase.include?(search)
                    results.push(contact) unless results.include?(contact)
                end
            end
        end
        print_results("Addresss search results: #{search}", results)
    end

    def print_results(search, results)
        puts "#{search}"
        results.each do |contact|
            puts contact.to_s("full_name")
            contact.print_phone_numbers
            contact.print_addresses
            puts "\n" 
        end
    end

    def print_contact_list
        puts "Contact List"
        contacts.each do |contact|
            puts contact.to_s('last_first')
        end
    end
end

addressbook = AddressBook.new

andrey = Contact.new

andrey.first_name = "Andrey"
andrey.middle_name = "Igorevich"
andrey.last_name = "Komolov"

andrey.add_phone_number("Phone", "911-123-45-67")
andrey.add_phone_number("Phone", "912-321-54-76")

andrey.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

addressbook.contacts.push(andrey)

jose = Contact.new

jose.first_name = "Jose"
jose.middle_name = "Marcus"
jose.last_name = "Dacascos"

jose.add_phone_number("Phone", "911-987-65-43")
jose.add_phone_number("Phone", "912-412-22-44")

jose.add_address("Office", "2201 Main St.", "", "Texas", "TX", "27564")

addressbook.contacts.push(jose)
addressbook.print_contact_list

puts "-" * 100
# We call addressbook .find_by_name method with "Andrey" 
addressbook.find_by_name("Jose")
addressbook.find_by_name("Andrey")

puts "-" * 100
# Call find_by_phone_number method with "911"
addressbook.find_by_phone_number("123")

puts "-" * 100
# Caled find_by_address method to find "2201" address
addressbook.find_by_address("2201")

# Called menu from .run method
addressbook.run 

