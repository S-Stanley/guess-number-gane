package main

import (
	"fmt"
	"strconv"
	"time"
	"math/rand"
)

var MIN int = 0;
var MAX int = 100;

func getUserInput() int {
	fmt.Printf("Guess a number between %d and %d\n", MIN, MAX);
	var user_input string;
	fmt.Scanln(&user_input);
	value, err := strconv.Atoi(user_input);
	if (err != nil){
		fmt.Println("err expected integer");
		return (getUserInput());
	}
	return (value);
}

func main(){
	rand.Seed(time.Now().UnixNano());
	random_numer := rand.Intn(MAX)
	tries := 1;
	for true {
		user_input := getUserInput()
		if (user_input < random_numer){
			fmt.Println("Try higher");
		} else if (user_input > random_numer) {
			fmt.Println("Try lower");
		} else {
			fmt.Printf("Correct in %d tries!", tries);
			break;
		}
		tries++;
	}
}