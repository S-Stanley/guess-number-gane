let MIN = 0;
let MAX = 100;
let RANDOM = Int.random(in: MIN..<MAX);

func getUserInput() -> Int{
    let user_input = Int(readLine()!) ?? nil;
    if (user_input == nil) {
        print("Please provide an number between \(MIN) and \(MAX)");
        return(getUserInput());
    }
    return (user_input ?? -1);

}

func main() {
    print("Guess a number between \(MIN) and \(MAX)");
    var tries = 1;
    while (true) {
        let user_input = getUserInput();
        if (user_input == -1){
            break;
        }
        else if (user_input < RANDOM){
            print("Try higher")
        }
        else if (user_input > RANDOM){
            print("Try lower");
        }
        else {
            print("You found the correct answer in \(tries) tries!");
            break;
        }
        tries += 1;
    }
}

main();