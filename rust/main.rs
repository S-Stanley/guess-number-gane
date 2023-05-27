// use rand::Rng;
// extern crate rand;
// use crate::rand::Rng
extern crate rand;
use rand::Rng;

const MIN: i32 = 0;
const MAX: i32 = 100;

fn get_user_input() -> i32{
    let mut user_input = String::new();
    std::io::stdin().read_line(&mut user_input).unwrap();
    let user_input_int: i32 = user_input.trim().parse::<i32>().unwrap_or(-1);
    if user_input_int == -1 {
        println!("Expected number between {MIN} and {MAX}");
        return get_user_input();
    }
    return user_input_int;
}

fn main() {
    println!("Guess a number between {MIN} and {MAX}");
    let mut number_of_tries = 1;
    let random_number: i32 = rand::thread_rng().gen_range(MIN..MAX);
    loop {
        let user_input = get_user_input();
        if user_input < random_number {
            println!("Try higher!");
        } else if user_input > random_number {
            println!("Try lower!");
        } else {
            println!("You found the correct answer in {number_of_tries} tries");
            break;
        }
        number_of_tries += 1;
    }
}