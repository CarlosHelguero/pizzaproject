#!/bin/bash
#author Joey Smith 
clear

echo "Please provide your delivery information."

while true
do
read -p "First Name: " firstName
read -p "Last Name: " lastName
read -p "Address: " address
read -p "City: " city
read -p "State: " state
read -p "Zip code: " zipCode
read -p "Phone number: " phoneNumber

sleep 1
clear 


echo "Thank you very much."
echo "The delivery information that I have is..."

echo "$firstName" "$lastName"
echo "$address, $city, $state, $zipCode, and $phoneNumber."
read -p "Do I have the order name correct? [y or n]: " orderName

if [ "$orderName" == "y" ] || [ "$orderName" == "Y" ]
then
         echo ""
         echo "Okay! "
         echo ""
break
#Delivery Information (name, number, address)
elif [ "$orderType" == "n" ] || [ "$orderType" == "N" ]
then
         echo "Okay, please make the corrections."
#
else
         echo ""
fi
done

