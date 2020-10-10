def add(first, second)
    puts first, second
    puts first + second
end

def subtract(first, second)
    puts first, second
    puts first - second
end


add(100, 50) # 150
subtract(75, 25) # 50
add(3, 4) # 7
subtract(10, 5) # 5



def wait(seconds)
    puts "Waiting..."
    sleep seconds
    puts "Done"
end
  
wait 1
wait 3
  
