class SimpleBanchmark
    def run(&block)
        start_time = Time.now
        block.call
        end_time = Time.now
        elapsed = end_time - start_time
        puts "Pentagon hacked"
        puts "Elapsed time: #{elapsed}"
    end
end

benchmark = SimpleBanchmark.new

benchmark.run do
    puts "Hacking the Pentagon!!!"
    counter = 0
    10.times do
        print "#{counter}%"
        9.times do 
            sleep(rand(0.01..0.5))
            print"."
        end
        counter += 10
    end
end