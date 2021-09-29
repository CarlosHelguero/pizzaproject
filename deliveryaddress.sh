#!/bin/bash
#author Joey Smith 
clear
# Take Out Option for Payment and Payment address
echo "Thank you for your order!"
echo " "
echo "Please provide your payment information."
echo " "
while true
do

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
echo "$address, $city, $state, $zipCode, and $phoneNumber."
echo " "
read -p "Is this correct? [y or n]: " orderName
echo " "
if [ "$orderName" == "y" ] || [ "$orderName" == "Y" ]
then
         echo "Okay! "
         echo " "
break
#Delivery Information (name, number, address)
elif [ "$orderType" == "n" ] || [ "$orderType" == "N" ]
then
         echo "Okay, please make the corrections."
	 echo " "
else
         echo "Short Circuit ;)"
fi
done

# Start of card information collection

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
                echo "Saving payment information... "
                echo " "
                echo "********************************* " >> pythonstuff/reciept.txt
                echo "Payment Information: " >> pythonstuff/reciept.txt
                echo "$address, $city, $state, $zipCode" >> pythonstuff/reciept.txt
                echo "$card, $carddate, $cardcode" >> pythonstuff/reciept.txt
                sleep 1
                break
	elif [ "$cardconfirm" == "n" ] || [ "$cardconfirm" == "N" ]
        then
                echo "Please, Enter new credit/debit card information. "
                echo " "
        else
                echo "Short Circuit ;)"

	fi
done


sleep 1
clear

