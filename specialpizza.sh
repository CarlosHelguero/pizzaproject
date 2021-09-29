#!/bin/bash

# Special Logic




# >>----> Sopranos Pizzeria Specials
prompt()
{
echo "1.) 1-Large Pepperoni Pizaa, 1 Large Cheese Pizza, and 1 2-Liter for $ 24.99" 
echo "2.) 1-Large Meat Lovers Pizza, 1-Medium Cheese Pizza, 1-Medium Pepperoni Pizza, and 2 2-Liter for $ 27.99" 
echo "3.) 2-Extra Large Cheese Pizza, 1-Large Pepperoni Pizza, and 1-Large Cheese Pizza , 2 2-Liter for $ 30.99"
}

while true
do
prompt
read -p "Which one of the special would you like? [1-3]: " specials
    if (("$specials" == 1))
    then
            echo "Okay, you have selected special #1"
            echo ""
            read -p "Would you like to select another special? [y or n]:" selection
            #If the customer want to select another special pizza to add to there order

            if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
            then

            prompt

            echo "Which one of the special would you like? [1-3]: "

            #If the customer does not want to order another special then
            #the customer will be taken to the delivery options
            elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
            then
            	echo "Okay, lets continue your order."
                break
            	sleep 1 
            else
            	echo "Okay, lets continue your order."
            	sleep 1 
                
            fi
            echo "deal 1"
    elif  (("$specials" == 2))
    then
            echo "Okay, you have selected special #2"
            echo ""
            read -p "Would you like to select another special? [y or n]:" selection
            #If the customer want to select another special pizza to add to there order

            if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
            then

            

            echo "Which one of the special would you like? [1-3]: "
            
            

            #If the customer does not want to order another special then
            #the customer will be taken to the delivery options
            elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
            then
            	echo "Okay, lets continue your order."
                break
            	sleep 1 
            else
            	echo "Okay, lets continue your order."
            	sleep 1 
            fi
            echo "deal 1"
    elif (("$specials" == 3))
    then
            echo "Okay, you have selected special #3"
            echo ""
            read -p "Would you like to select another special? [y or n]:" selection
            #If the customer want to select another special pizza to add to there order

            if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
            then

            

            echo "Which one of the special would you like? [1-3]: "
            
            

            #If the customer does not want to order another special then
            #the customer will be taken to the delivery options
            elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
            then
            	echo "Okay, lets continue your order."
                break
            	sleep 1 
            else
            	echo "Okay, lets continue your order."
            	sleep 1 
            fi
            echo "deal 1"
    else
    echo "this is a test"
    break
    fi
done
#Customer selecting which special 
