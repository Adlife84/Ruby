class BankAccount
    attr_reader :name

    def initialize (name)
        @name = name
        @transactions = []
        add_transaction("Beginning Balance", 0)
    end

    def credit(description, amount)
        add_transaction(description, amount)
    end

    def debet(description, amount)
        add_transaction(description, -amount)
    end

    def add_transaction(description, amount)
        @transactions.push(description: description, amount: amount)
    end

    def balance
        balance = 0.0
        @transactions.each do |transaction|
            balance += transaction[:amount]
        end
        return balance
    end

    def to_s
        "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
    end
end

# Create a new object from class BankAccount 
bank_account = BankAccount.new("Andrey")

# Add transactions to account object
bank_account.credit("Paycheck", 100)
bank_account.debet("Fuel for car", 40)

# PrintOut balance of name
puts bank_account.inspect
puts bank_account