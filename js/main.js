const MIN = 0;
const MAX = 100;

const random_number = Math.floor(Math.random() * MAX);

const get_user_input = async() => {
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    });

    const input = await new Promise((resolve) =>
        readline.question(`guess a number between ${MIN} and ${MAX}\n`, (user_input) => {
            readline.close();
            resolve(user_input);
        })
    );
    return (input);
};

const play_game = async() => {
    tries = 0;

    while (true){
        const user_input = await get_user_input();
        if (user_input.replaceAll(' ', '').toLowerCase() === 'exit'){
            break;
        }
        const user_input_numbered = parseInt(user_input, 10);
        if (isNaN(user_input_numbered)){
            console.error('Expected number');
            continue;
        }

        if (user_input_numbered < random_number) {
            console.info('Try higher!');
        }
        else if (user_input_numbered > random_number) {
            console.info('Try lower!');
        }
        else {
            console.info(`You found it in ${tries} try!`);
            break;
        }
        tries++;
    }
}

play_game();