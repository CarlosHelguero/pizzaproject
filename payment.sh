#!/bin/bash

clear

echo "Please provide your delivery information."
echo " "
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
echo " "
echo "The delivery information that I have is..."
echo " "
echo "$firstName" "$lastName"
echo "$address, $city, $state, $zipCode, and $phoneNumber."
echo " "
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




clear
header
# Start of payment collection
echo "Thank you for your order!"
echo " "
echo "Please provide your payment information."
echo " "
# While true for payment and to confirm address
while true
do

read -p "Last four of credit card " card
read -p "Expiration Date MM/YY " carddate
read -p "Security code on back/front " cardcode
echo " "
echo "Thank you!"
sleep 1
clear
echo " "
echo "Card - $card"
echo "Date - $carddate"
echo "Code - $cardcode"
echo " "
read -p "Does everything look correct? [y or n] " cardconfirm
echo " "
# Confirming the payment information 
	if [ "$cardconfirm" == "y" ] || [ "$cardconfirm" == "Y" ]
        then 
                echo "Saving card information... "
                sleep 1
		clear
			# Validating if Delivery address is Payment address
			echo "$firstName" "$lastName"
			echo "$address, $city, $state, $zipCode"
			echo " "
			read -p "Using delivery address as the card address? [y or n] " cardaddress
				# Confirming address or re-enter it
				if [ "$cardaddress" == "y" ] || [ "$cardaddress" == "Y" ]
				then
					echo " "
					echo "Saving payment information... "
					echo " "
					echo "$firstName" "$lastName" > ../pythonstuff/reciept.txt
                        		echo "$address, $city, $state, $zipCode" >> ../pythonstuff/reciept.txt
					echo "$card, $carddate, $cardcode" >> ../pythonstuff/reciept.txt
               				break

				elif [ "$cardaddress" == "n" ] || [ "$cardaddress" == "N" ]
				then
					echo " "
					echo "Please provide payment address. "
					echo " "
					read -p "what is your street address " caddress
					read -p "what is the city " ccity
					read -p "what is the state " cstate
					read -p "what is your zip code " czipcode
					echo " "
					echo "Saving payment information... "
                                        echo " "
                                        echo "$firstName" "$lastName" > ../pythonstuff/reciept.txt
                                        echo "$caddress, $ccity, $cstate, $czipCode" >> ../pythonstuff/reciept.txt
                                        echo "$card, $carddate, $cardcode" >> ../pythonstuff/reciept.txt
				else
					echo "Unrecognized Entry"
				fi
		break
        elif [ "$cardconfirm" == "n" ] || [ "$cardconfirm" == "N" ]
	then echo "Please, Enter new credit/debit card information. "
	echo " "
        else
             echo "Wrong selection"

fi
done


sleep 1
clear
