#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# get services
SERVICES=$($PSQL "SELECT * FROM SERVICES" )

MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo -e "\n~~~Salon Appointment Scheduler~~~\n"

  # Show list of services
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Get user service
  echo -e "\nPlease choose an option"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    [1-3]) RESERVATION $SERVICE_ID_SELECTED ;;
    *) MENU "Please enter a valid option." ;;
  esac
}

RESERVATION () {
  
  SERVICE_ID_SELECTED=$1
  
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE

  # Look for customer phone
  if [[ -z $($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE'") ]]
  then
    echo -e "\nPlease enter your name:"
    read CUSTOMER_NAME

    # Insert phone and name to database
    INSERT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nPlease enter your service time:"
  read SERVICE_TIME

  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) Values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}

MENU