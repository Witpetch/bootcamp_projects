
# welcome message
  print("Welcome to DR Pizza.")
  print("Hello ^^ Welcome to DR Pizza.")
  print("What your's name.")
  user_name <- readLines("stdin", n=1)
  print(paste("Hi", user_name))
  print("What would you like to do ?")
  print("1.Order Pizza (Please press 1)")
  print("2.Contact Staff (Please press 2)")
  print("3.Cancle (Please press 3)")
  user_select <- readLines("stdin", n=1 )
#Variables
  cancle_check <- 0

  #Contact Staff
  if (user_select == "2")
  {
    print ("Please contract us by phone Tel.02-555-5555 or Line : @DRpizza.")
    print ("Would you like to order pizza ?.Y:yes , N:no")
    user_input <- readLines("stdin", n=1 )
      if (toupper(user_input == "N"))
      {
        print("Thank you for visiting us. See you later.")
        cancle_check = 1
        break
      } else if (toupper(user_input == "Y"))
        cancle_check = 0     
  }

  #Cancle
  if (user_select == "3")
  {
    print ("Do you want to cancel your order ? Y:yes , N:no")
    user_input <- readLines("stdin", n=1 )
    if (toupper(user_input == "Y"))
      {
        print("Thank you for visiting us. See you later.")
        cancle_check = 1
        break
      } else if (toupper(user_input == "N"))
        print("Awesome!, Please continue your order.")
        cancle_check = 0
    }
    
  if (cancle_check == "0" | user_select == "1"){
  #Order Pizza function
  #Select Toppings
    get_topping <- function(topping){
      price_pizza <-0
      if(topping == 1)
      {
        return("Hawaiian")
      } else if(topping == 2) {
        return("Seafood Cocktail")
      } else if(topping==3) {
        return("Spicy Super Seafood")
      } else if(topping==4) {
        return("Meat Deluxe")
      } else if(topping==5) {
        return("Cheese & Bacon")
      } else {
        return(NA)
      }
    }
    
  #uo = user_order
  #us = user_select
  input_check <- 0
  while(input_check < 1){
        print("What toppings would you like on your pizza? Please select from the following options:")
        print("1.Hawaiian (Ham, Bacon, Pineapple)")
        print("2.Seafood Cocktail (Shrimp, Crab Sticks, Ham, Pineapple)")
        print("3.Spicy Super Seafood (Squid, Garlic Pepper Shrimp, Red Chilli, Basil, Onion)")
        print("4.Meat Deluxe (Ham, Bacon, Pepperoni, Smoked Sausage, Italian Sausage)")
        print("5.Cheese & Bacon (Bacon, American/Emmental/Parmesan/Mozzarella Cheese)")
        us_topping <- readLines("stdin", n=1 )
      if(us_topping %in% 1:5){
        print(paste("You have selected the following toppings:", get_topping(us_topping), "pizza."))
        input_check = input_check + 1
        break
        } else {
          print ("Please select topping from the following options (Input only number).")
        }
      }
  #Select Size
  get_size <- function(size){
      if(size==1)
      {
        return("small")
      } else if(size==2) {
        return("medium")
      } else if(size==3) {
        return("large")
      } else {
        return(NA)
      }
  }
    
  input_check <- 0
  while(input_check < 1){
    print("What size pizza would you like? Please select from the following options:")
    print("1.Small (4 Slices)")
    print("2.Medium (6 Slices)")
    print("3.Large (8 Slices)")
    us_size <- readLines("stdin", n=1 )
    if(us_size %in% 1:3){
      print(paste("You have selected a", get_size(us_size), "pizza."))
      input_check = input_check + 1
      break
        } else {
          print ("Please select pizza size from the following options (Input only number).")
        }
      }
    
  #Select Crust
  get_crust <- function(crust){
      if(crust==1)
      {
        return("Pan")
        } else if(crust==2) {
        return("Thin")
        } else if(crust==3) {
        return("Extreme Cheese")
        } else if(crust==4) {
        return("Extreme Sausage Cheese")
        } else {
        return(NA)
        }
      }
  input_check <- 0
  while(input_check < 1){
    print("What pizza crust would you like? Please select from the following options:")
    print("1.Pan")
    print("2.Thin")
    print("3.Extreme Cheese")
    print("4.Extreme Sausage Cheese")
    us_crust <- readLines("stdin", n=1 )
    if(us_crust %in% 1:4){
      print(paste("You have selected a", get_crust(us_crust), "crust."))
      input_check = input_check + 1
      break
        } else {
          print ("Please select pizza crust from the following options (Input only number).")
        }
      }
  #Select Sauce
  input_check <- 0
  while(input_check < 1){
    print("Please select favorite sauce for your pizza from the following options :")
    print("1.Pizza sauce")
    print("2.Thousand island sauce")
    print("3.Marinara sauce")
    print("4.Sour cream sauce")
    us_sauce <- readLines("stdin", n=1 )
      if(us_sauce %in% 1:4){
        if (us_sauce==1){
            print("Got it, We will add Pizza sauce for your pizza")
            get_sauce = "Pizza sauce"
          } else if (us_sauce==2){
            print("Awesome!! Thousand island sauce is the best seller sauce.")
            get_sauce = "Thousand island sauce"
          } else if (us_sauce==3){
            print("Cool, Marinara sauce will add on your pizza. :) ")
            get_sauce = "Marinara sauce"
          } else if (us_sauce==4){
            print("Great Choice, We will add Sour cream sauce for your pizza ")
            get_sauce = "Sour cream sauce"
          }
          input_check = input_check + 1
          break
        } else {
          print ("Please select favorite sauce from the following options (Input only number).")
        }
    }
  }# End Pizza order loop

#Conclude pizza order
#Drinkprice
    get_drink <- function(drink){
      if(drink==1)
      {
        return("Coke")
      } else if(drink==2) {
        return("Sprite")
      } else if(drink==3) {
        return("Water")
      } else if(drink==4) {
        return("No drink")
      } else {
        return(NA)
      }
  }
  #Drink function
  input_check <- 0
  while(input_check < 1){
    print("Your pizza order completed.")
    print("Would you like a drink with your order? We offer Coke, Sprite, Water, or None. Please enter the number of the drink you would like.")
    print("1. Coke")
    print("2. Sprite")
    print("3. Water")
    print("4. None")
    us_drink <- readLines("stdin", n=1 )
      if(us_drink %in% 1:4){
        print(paste("You have selected a", get_drink(us_drink)))
        input_check = input_check + 1
        break
        } else {
          print ("Please select drink from the following options (Input only number).")
        }
  }
  # Order Price
      price_pizza <- 0
      prize_size <- 0
      prize_crust <- 0
      prize_drink <- 0
      #Pizza Topping Price
      if(us_topping == "1")
        {
        price_pizza <- 279
        } else if (us_topping == "2") {
        price_pizza <- 349
        } else if (us_topping == "3") {
        price_pizza <- 349
        } else if (us_topping == "4"){
        price_pizza <- 319
        } else if (us_topping == "5"){
        price_pizza <- 319
        }
      #Pizza Size Price
      if(us_size == "1")
        {
        prize_size <- 0
        } else if (us_size == "2") {
        prize_size <- 40
        } else if (us_size == "3"){
        prize_size <- 80
        }
      #Pizza Crust Price
      if(us_crust == "1")
        {
        prize_crust <- 20
        } else if (us_crust == "2") {
        prize_crust <- 0
        } else if (us_crust == "3"){
        prize_crust <- 40
        } else if (us_crust == "4"){
        prize_crust <- 70
        }
      #Drink Price
      if(us_drink == "1")
        {
        prize_drink <- 25
        } else if (us_drink == "2") {
        prize_drink <- 25
        } else if (us_drink == "3"){
        prize_drink <- 15
        } else if (us_drink == "4"){
        prize_drink <- 0
        }
      order_prize <- price_pizza + prize_size + prize_crust + prize_drink
  # Confirm order
    print("=================================================================")
    print("Please confirm your order details:")
    print(paste("Toppings: ",get_topping(us_topping)))
    print(paste("Size: ", get_size(us_size)))
    print(paste("Crust: ", get_crust(us_crust)))
    print(paste("Sauce: ", get_sauce))
    print(paste("Drink: ", get_drink(us_drink)))
    print(paste("The total cost of your order is ", order_prize, ".", "THB"))
    print("=================================================================")

    print("Is this correct? Please type 'Y' to confirm your order or 'N' to cancel.")
    user_input <- readLines("stdin", n = 1)
    if(toupper(user_input)=="Y") {
      print("We will process payment and delivery")
      print("What payment method would you like to use? We accept 1:cash, 2:credit card,
            and 3:QR code.")
      payment_method <- readLines("stdin", n = 1)
      print(paste("Got it, you would like to pay by using",
                  ifelse(payment_method==1,"cash",
                  ifelse(payment_method==2,"credit","QR code"))))

     print("What is your delivery address?")
     delivery_address <- readLines("stdin", n = 1)
     print(paste("Got it, your delivery address is ", delivery_address, ".", sep = ""))

     print("Thank you for your order! Your pizza will be delivered to you shortly.")
    } else {
      print("Your order has been cancelled. Thank you for visiting us. See you later.")
    }