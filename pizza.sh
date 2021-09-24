#!/bin/bash

# >>----> Sopranos Pizzeria logic


# additional code information to make up the pizza so that the user can select there topic

# >>----> Sopranos Pizzeria Prompts/Display/User Interaction

echo "Welcome to Soprano's Pizzeria."

# >>----> User will select between if that they will select a special

read -p "Are you interested in any of our specials? [y or n]: " specials
clear
if [ "$specials" == "y" ] || [ "$specials" == "Y" ]

then
        echo "Awesome!"

        echo "Here are some of our specials."
        echo ""
        ./specialpizza.sh

elif [ "$specials" == "n" ] || [ "$specials" == "N" ]
then
        echo "Okay."
else
        echo "Invalid Selection."
fi


# >>----> If the user select yes for the specials, this will display the specials











# >>----> Type of order that the user is going to use.
echo ""
echo ""
read -p "Is this going to be for delivery? [y or n]: " orderType
clear
if [ "$orderType" == "y" ] || [ "$orderType" == "Y" ]
then
        echo "Okay, your order will be for delivery."
        echo ""
        ./deliveryaddress.sh
#Delivery Information (name, number, address)
elif [ "$orderType" == "n" ] || [ "$orderType" == "N" ]
then
        echo "Okay, your order will be for pick-up."
# Store information
else
        echo "Invalid Selection."
fi
c
