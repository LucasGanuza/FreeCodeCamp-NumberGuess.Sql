#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo Enter your username:
read INPUT_NAME

USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$INPUT_NAME'")

if [[ -z $USERNAME_ID ]]
then
  NEW_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$INPUT_NAME', 0, null)")
  echo Welcome, $INPUT_NAME! It looks like this is your first time here.
else 
  USER_NAME=$($PSQL "SELECT username FROM users WHERE username_id='$USERNAME_ID'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username_id='$USERNAME_ID'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username_id='$USERNAME_ID'")
  echo $BEST_GAME
  
  echo Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

SECRET_NUMBER=$(( $RANDOM % 1000 + 1))

INPUT_NUMBER=0;

echo Guess the secret number between 1 and 1000:

for (( GUESS_COUNT=1; SECRET_NUMBER != INPUT_NUMBER; GUESS_COUNT++ ));
do
  read INPUT_NUMBER

  if [[ ! $INPUT_NUMBER =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
  else 
    if [[ $INPUT_NUMBER -gt $SECRET_NUMBER ]]
    then
      echo It\'s lower than that, guess again:
    elif [[ $INPUT_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo It\'s higher than that, guess again:
    else
      echo You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!
      if [[ $BEST_GAME -eq 0 ]] || [[ $GUESS_COUNT -lt $BEST_GAME ]]
      then
        UPDATE_VALUES=$($PSQL "UPDATE users SET games_played=games_played + 1, best_game=$GUESS_COUNT WHERE username='$INPUT_NAME'")
      else
        UPDATE_VALUES=$($PSQL "UPDATE users SET games_played=games_played + 1 WHERE username='$INPUT_NAME'")
      fi
    fi
  fi
done

# 
