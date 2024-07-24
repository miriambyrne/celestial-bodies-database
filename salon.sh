#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ My Salon ~~~~~\n"


MAIN_MENU() {
  if [[ $1 ]]
  then 
  echo $1
  fi
echo -e "\nWelcome to my salon. How can I help you?"
AVAILABLE_SERVICES=$($PSQL "select service_id,name from services")

echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
do
echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED
SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")

#if input isn't a number or isn't in table
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ || -z $SELECTED_SERVICE_NAME ]]
then 
#send back to main menu
MAIN_MENU "I could not find that service. What would you like today?."
else
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
#if doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
#get new customer name
echo -e "\nWhat's your name?"
read CUSTOMER_NAME
#add customer
INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi
#get customer id
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
#ask for a time
echo -e "\nWhat time would you like your appointment, $CUSTOMER_NAME?"
read SERVICE_TIME
#book appointment
BOOK_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED, '$SERVICE_TIME')")
echo -e "\nI have put you down for a $(echo $SELECTED_SERVICE_NAME | sed 's/^ *| *$//') at $SERVICE_TIME, $CUSTOMER_NAME."
#update appointments table
fi

}


MAIN_MENU
