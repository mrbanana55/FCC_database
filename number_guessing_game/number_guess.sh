#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( ($RANDOM % 1000) + 1 ))

echo -e "\n~~Number Guessing Game~~\n"
echo Enter your username:
read INPUT

# check if user exists
USERNAME=$($PSQL "SELECT username FROM users WHERE username='$INPUT'")
if [[ -z $USERNAME ]]
then
  # add user if not exists
  USERNAME=$INPUT
  INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # get user ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  
  echo Welcome, $USERNAME! It looks like this is your first time here.
else
  # get info if user exists
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(attempts) FROM games WHERE user_id=$USER_ID")

  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

ATTEMPTS=1

echo Guess the secret number between 1 and 1000:
read NUMBER_GUESS


until (( NUMBER_GUESS == SECRET_NUMBER ))
do
  if ! [[ $NUMBER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    (( ATTEMPTS += 1 ))
  elif (( NUMBER_GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
    (( ATTEMPTS += 1 ))
  elif (( NUMBER_GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
    (( ATTEMPTS += 1 ))
  fi
  read NUMBER_GUESS
done

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, secret_number, attempts) VALUES($USER_ID, $SECRET_NUMBER, $ATTEMPTS)")

echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"

