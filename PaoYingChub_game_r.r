# Fucntion determine winner
# Variable (set rock = 1, scissors = 2, paper = 3)
determine_winner <- function(computer_choice,player_choice)
  if(player_choice == "3" & computer_choice == "1"){
    return ("player")
  } else if(player_choice == "2" & computer_choice == "3"){
    return ("player")
  } else if(player_choice == "1" & computer_choice == "2"){
    return ("player")  
  } else if(player_choice == computer_choice) {
    return ("draw")
  } else {
    return ("computer")
  }

  #Player choice input
  #Input number of rounds
    print("Welcome to Pao Ying Chub game, Let's play")
    print("Enter the number of rounds you want to play (Input as number only): Press 0 for exit")
    rounds_input <- readLines("stdin", n = 1)
      if (rounds_input != 0 ){
        print(paste("let's play for ",rounds_input,"rounds"))
      } else if (rounds_input == 0 ) {
        print("Let's play together next time. See you. :)")
        break
      }

  # Function to start game
    game_start <- function() {
  # Initialize win/loss/draw variables and count
    player_wins <- 0
    computer_wins <- 0
    draws <- 0
    rounds_play <- 0
      
# Print the result
    print_result = function(){
    print(paste("Player choose", player_choice))
    print(paste("Computer choose", computer_choice))
    print(paste("Result for round",rounds_play))
    print(paste("Wins:", player_wins))
    print(paste("Losses:", computer_wins))
    print(paste("Draws:", draws))
    }
    while (TRUE) {
    # Choose a random choice for the computer
    computer_choice <- sample(1:3, 1)
    # Player input choice
    print(paste("Enter your choice for round",rounds_play+1,"(Input only number of your choice)"))
    print("Press 1. for Rock (Rock will win scissors and lose to paper")
    print("Press 2. for Scissors (Scissors will win paper and lose to rock")
    print("Press 3. for Paper (Paper will win rock and lose to scissors")
    print("Press 0 for exit")
    player_choice <- readLines("stdin", n = 1)

    #Input = Null
      if (is.na(player_choice)){
      print("Please choose your choice for play this round. (Input only number)")
      next
    } 
    #Input != 0:3 (Invalid input)
      if (!(player_choice %in% 0:3)){
      print("Invalid choice. Please try again")
      next
    }
    #Input = 0 exit game.
      if (player_choice == 0) {
      print("Let's play together next time. See you. :)")
      break
    } 
    #Input = 0:3 find the result
      result <- determine_winner(computer_choice,player_choice) 
      if (result == "player" & rounds_play < rounds_input) {
      player_wins <- player_wins +1
      rounds_play <- rounds_play +1
      print_result()
    } else if (result == "computer" & rounds_play < rounds_input) {
      computer_wins <- computer_wins +1
      rounds_play <- rounds_play +1
      print_result()
    } else if (result == "draw" & rounds_play < rounds_input){
      draws <- draws +1
      rounds_play <- rounds_play +1
      print_result()   
    } else {
        print(paste("Summary result Pao Ying Chub game for",rounds_input,"rounds"))
        print(paste("Wins:", player_wins))
        print(paste("Losses:", computer_wins))
        print(paste("Draws:", draws))
        break
    } 
    } 
    }
    
    #Start Pao Ying Chub game
    game_start()