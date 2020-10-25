require "./contact_class.rb"

class AddressBook

    attr_reader :contacts

    def initialize
        @contacts = []
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
jose.add_phone_number("Phone", "912-312-22-44")

jose.add_address("Office", "2201 Main St.", "", "Texas", "TX", "27564")

addressbook.contacts.push(jose)




addressbook.print_contact_list

puts "-" * 100
# We call addressbook .find_by_name method with "Andrey" 
addressbook.find_by_name("Jose")
addressbook.find_by_name("Andrey")

