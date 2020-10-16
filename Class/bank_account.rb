class BankAccount
    def initialize (name)
        @name = name
        @transactions = []
    end
end

bank_account = BankAccount.new("Andrey")

puts bank_account.inspect