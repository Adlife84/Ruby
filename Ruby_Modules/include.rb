module Fetcher
    def self.included(klass)
        attr_reader :fetch_count
    end
    
    def fetch(item)
        @fetch_count ||= 0
        @fetch_count += 1
        puts "[#{@name}, Fetch count: #{@fetch_count}] #{name} bring that #{item} right back!"
    end 
end

# Class Dog
class Dog
    include Fetcher #this let us use method fetch from module Fetcher for any class where it included

    attr_reader :name

    def initialize(name)
     @name = name
    end
end

# Class Cat
class Cat
    include Fetcher
    attr_reader :name

    def initialize(name)
        @name = name
    end
end


# Make sure that it works
dog = Dog.new('Jake')
dog.fetch("Stick")

cat = Cat.new('Barsik')
cat.fetch("Mouse")
cat.fetch("Fly")

