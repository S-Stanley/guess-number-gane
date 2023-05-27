MIN = 0
MAX = 100
RANDOM = rand(MIN..MAX)

def get_user_input
    user_input = gets.to_i
    if user_input == 0
        puts "Please provider a number between #{MIN} and #{MAX}"
        return get_user_input()
    end
    return user_input
end

def game
    puts "Guess a number between #{MIN} and #{MAX}"
    number_of_tries = 1
    while true
        user_input = get_user_input()
        if user_input < RANDOM
            puts "Try higher"
        end
        if user_input > RANDOM
            puts "Try lower"
        end
        if user_input == RANDOM
            puts "You found the correct answer in #{number_of_tries} tries"
            break
        end
        number_of_tries += 1
    end
end

game()