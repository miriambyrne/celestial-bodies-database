#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=0
echo "Enter your username:"
read USERNAME

#try to get user id
USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")

#if user exists
if [[ $USER_ID ]]
# gather info
then
GAMES_PLAYED=$($PSQL "select games_played from users where user_id=$USER_ID")
BEST_GAME=$($PSQL "select best_game from users where user_id=$USER_ID")
# and echo welcome back message
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

#if user does not exist
#add user to database
else 
ADD_USER_TO_DATABASE=$($PSQL "insert into users(username) values('$USERNAME')")
#get new user_id
USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
#echo welcome message
echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

#create game
function TRY_GUESS() {

read GUESS



#if guess is a number 
if [[ $GUESS =~ ^[0-9]+$ ]]
then
((NUMBER_OF_GUESSES++))
  #if guess is correct
if [[ $GUESS -eq $SECRET_NUMBER ]]
then
if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
then
UPDATE_BEST_GAME=$($PSQL "update users set best_game=$NUMBER_OF_GUESSES where user_id=$USER_ID")
fi
UPDATE_GAMES_PLAYED=$($PSQL "update users set games_played=games_played::int+1 where user_id=$USER_ID")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
exit

#if guess is out of bounds
elif [[ $GUESS -gt 1000 || $GUESS -lt 1 ]]
then 
TRY_GUESS

#if guess is lower than secret number
elif [[ $GUESS -lt $SECRET_NUMBER ]]
then
echo "It's higher than that, guess again:"
TRY_GUESS

#if guess is higher than secret number
elif [[ $GUESS -gt $SECRET_NUMBER ]]
then 
echo "It's lower than that, guess again:"
TRY_GUESS
fi


#else if guess is not a number
else
echo "That is not an integer, guess again:"
TRY_GUESS
fi

}
echo "Guess the secret number between 1 and 1000:"
TRY_GUESS