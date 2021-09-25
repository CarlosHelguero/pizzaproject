#!/bin/bash

# Special Logic




# >>----> Sopranos Pizzeria Specials
echo "1.) 1-Large Pepperoni Pizaa, 1 Large Cheese Pizza, and 1 2-Liter for $ 24.99" 
echo "2.) 1-Large Meat Lovers Pizza, 1-Medium Cheese Pizza, 1-Medium Pepperoni Pizza, and 2 2-Liter for $ 27.99" 
echo "3.) 2-Extra Large Cheese Pizza, 1-Large Pepperoni Pizza, and 1-Large Cheese Pizza , 2 2-Liter for $ 30.99"

read -p "Which one of the special would you like? [1-3]: " specials
while true
do
if (("$specials" == 1))
then
        echo "Okay, this is a test comment"
        echo ""
        read -p "Would you like to select another special? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
		then

        echo "the loop needs to start over"
        
        break

        #If the customer does not want to order another special then
        #the customer will be taken to the delivery options
        elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
		then
			echo "Okay, "
			sleep 1 
		else
			echo "wrong selection"
			sleep 1 
		fi
elif  (("$specials" == 2))
then
        echo "Okay, this is a test comment"
        echo ""
        read -p "Would you like to select another special? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
		then

        echo "the loop needs to start over"
        
        break

        #If the customer does not want to order another special then
        #the customer will be taken to the delivery options
        elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
		then
			echo "Okay, "
			sleep 1 
		else
			echo "wrong selection"
			sleep 1 
		fi
elif (("$specials" == 3))
then
        echo "Okay, this is a test comment"
        echo ""
        read -p "Would you like to select another special? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
		then

        echo "the loop needs to start over"
        
        break

        #If the customer does not want to order another special then
        #the customer will be taken to the delivery options
        elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
		then
			echo "Okay, "
			sleep 1 
		else
			echo "wrong selection"
			sleep 1 
		fi
else
echo "this is a test"
fi
done
#Customer selecting which special 
