class Monster
    attr_reader :name
    
    def initialize(name)
        @name = name
        @actions = {
            screams: 0,
            run: 0,
            hide: 0
        }
    end

    def say(&block)
        print "#{name} says..."
        yield
    end

    def run(&block)
        @actions[:run] += 1
        print "#{name} runs! "
        yield
    end

    def hide(&block)
        @actions[:hide] += 1
        print "#{name} hides"
        yield
    end

    def scream(&block)
        @actions[:screams] += 1
        print "#{name} screams!"
        yield
    end

    def print_scoreboard
        puts "-" * 30
        puts "#{name} scoreboard"
        puts "-" * 30
        puts "- Scream: #{@actions[:screams]}"
        puts "-" * 30
        puts "- Hide: #{@actions[:hide]}"
        puts "-" * 30
        puts "- Run: #{@actions[:run]}"
        puts "-" * 30 
    end
end

monster = Monster.new("Fluffy")
monster.say { puts "Welcome to my home."}

monster.scream do 
    puts "BOO!!!"
end

monster.scream do 
    puts "BOO!!!"
end

monster.run do
    puts "Going to get you!"
end

monster.hide do
    puts "Running away and hiding!"
end

monster.print_scoreboard

