#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
REG='^[0-9]+$'
#if an argument is specified
if [[ $1 ]]
then 

#if arg is a number, see if it exists in database
if [[ $1 =~ $REG ]] 
then
if [[ $($PSQL "select atomic_number from elements where atomic_number=$1") ]]
then 
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1") 
SYMBOL=$($PSQL "select symbol from elements where atomic_number=$1")
ELEMENT_NAME=$($PSQL "select name from elements where atomic_number=$1")
else
echo "I could not find that element in the database."
exit
fi

#if not a number, presume it is a string
#check if it is a registered symbol
elif [[ $($PSQL "select symbol from elements where symbol='$1'") ]]
then
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1'")
SYMBOL=$($PSQL "select symbol from elements where symbol='$1'")
ELEMENT_NAME=$($PSQL "select name from elements where symbol='$1'")
#if not a symbol, check if it is a registered name
elif [[ $($PSQL "select name from elements where name='$1'") ]]
then
ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name='$1'")
SYMBOL=$($PSQL "select symbol from elements where name='$1'")
ELEMENT_NAME=$($PSQL "select name from elements where name='$1'")
fi

TYPE=$($PSQL "select type from types FULL JOIN properties USING(type_id) FULL JOIN elements USING(atomic_number) where atomic_number=$ATOMIC_NUMBER")
MASS=$($PSQL "select atomic_mass from types FULL JOIN properties USING(type_id) FULL JOIN elements USING(atomic_number) where atomic_number=$ATOMIC_NUMBER")
MELTING_POINT=$($PSQL "select melting_point_celsius from properties FULL JOIN types USING(type_id) FULL JOIN elements USING(atomic_number) where atomic_number=$ATOMIC_NUMBER")
BOILING_POINT=$($PSQL "select boiling_point_celsius from properties FULL JOIN types USING(type_id) FULL JOIN elements USING(atomic_number) where atomic_number=$ATOMIC_NUMBER")


if [[ -z $ATOMIC_NUMBER || -z $ELEMENT_NAME || -z $SYMBOL ]]
then
echo "I could not find that element in the database."
else 
echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi

else
echo Please provide an element as an argument.
fi
