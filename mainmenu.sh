#!/bin/bash

pizzaPrice=0

echo "Please take a moment to take a look at our main menu. "
echo ""
echo "Is there anything that I can get for you today?"
echo ""

sizeOfPizza()
{

echo "1. Small Pizza  $ 8.00 "
echo "2. Medium Pizza $ 11.00"
echo "3. Large Pizza  $ 14.00"
echo "4. Extra Large Pizza $ 16.00"
echo ""
echo ""
}

read -p "What pizza size would you like today? [ 1-4 ]: " size

while true
do

    if (("$size" == 1))
    then
        echo "Okay, you have selected small"
        pizzaPrice=$(( totalspecial + 25))
        echo " special deal 1 ----- 25" > pythonstuff/reciept.txt
        echo ""
        read -p "Would you like to select another pizza? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then



        echo "Which one of the pizza would you like? [1-4]: "

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
    elif  (("$size" == 2))
    then
        echo "Okay, you have selected medium"
        echo ""
        pizzaPrice=$(( totals + 11 ))
        echo "Medium $ 11.00" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select another soda? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which pizza would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
    elif  (("$size" == 3))
    then
        echo "Okay, you have selected large"
        echo ""
        pizzaPrice=$(( totals + 14 ))
        echo "Large $ 14.00" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select another pizza? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which pizza would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
    elif  (("$size" == 4))
    then
        echo "Okay, you have selected extra large"
        echo ""
        pizzaPrice=$(( totals + 16 ))
    echo "Extra Large $ 16.00" >> pythonstuff/reciept.txt
        read -p "Would you like to select another pizza? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which pizza would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
    else
    echo "this is a test"
    break
    fi
done

typeOfCrust()
{
echo ""
echo "1. Hand-Tossed."
echo "2. Crunchy Thin."
echo "3. Brookyln Style."
echo ""

echo ""
}

read -p "What type of crust would you like today? [ 1-3 ]: " crust

while true
do

    if (("$crust" == 1))
    then
        echo "Okay, you have selected hand-tossed"
        #pizzaPrice=$(( totalspecial + 25))
        echo " Hand-Tossed" > pythonstuff/reciept.txt
        echo ""
        read -p "Would you like to select another crust style? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then



        echo "What type of crust would you like today? [1-3]: "

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
    elif  (("$crust" == 2))
    then
        echo "Okay, you have selected crunchy thin crust"
        echo ""
        #pizzaPrice=$(( totals + 11 ))
        echo "Crunchy Thin" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select another crust style? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "What type of crust would you like today? [1-3]: "
        
        

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

    fi
    echo "deal 1"
    elif  (("$crust" == 3))
    then
        echo "Okay, you have selected Brookyln Style"
        echo ""
        #pizzaPrice=$(( totals + 14 ))
        echo "Brookyln Style" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select another crust style? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "What type of crust would you like today? [1-3]: "
        
        

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

    fi
    echo "deal 1"
done
#echo "What type of crust would you like? [ 1-3 ]:" crust

sauceType()
{
echo "1. Marinara Sauce"
echo "2. Honey BBQ Sauce"
echo "3. Alfedo Sauce"
echo "4. Garlic Parmesan Sauce"
echo ""

echo ""
echo ""
echo "Pefect! Great selection."
echo ""
}

read -p "What type of sauce would you like today? [ 1-4 ]:" sauce


while true
do

    if (("$sauce" == 1))
        then
        echo "Okay, you have selected Marinara Sauce"
        #pizzaPrice=$(( totalspecial + 25))
        echo "Marinara Sauce" > pythonstuff/reciept.txt
        echo ""
        read -p "Would you like to select a different sauce? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then



        echo "Which one of the sauce would you like? [1-4]: "

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
    elif  (("$sauce" == 2))
    then
        echo "Okay, you have selected medium"
        echo ""
        #pizzaPrice=$(( totals + 11 ))
        echo "Honey BBQ Sauce" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select a different sauce? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which one of the sauce would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
    elif  (("$sauce" == 3))
    then
        echo "Okay, you have selected medium"
        echo ""
        #pizzaPrice=$(( totals + 14 ))
        echo "Large $ 14.00" >> pythonstuff/reciept.txt # fix the price on this pizza
        read -p "Would you like to select another pizza? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which pizza would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
    elif  (("$sauce" == 4))
    then
        echo "Okay, you have selected medium"
        echo ""
        #pizzaPrice=$(( totals + 16 ))
        echo "Large $ 16.00" >> pythonstuff/reciept.txt
        read -p "Would you like to select another pizza? [y or n]:" selection
        #If the customer want to select another special pizza to add to there order

        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        then

        

        echo "Which pizza would you like? [1-4]: "
        
        

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

    fi
    echo "deal 1"
done






typeOfTopping()
{
echo "1. Cheese"
echo "2. Pepperoni"
echo "3. Sauage"
echo "4. Bacon"
echo "5. Chicken"
echo "6. Mushrooms"
echo "7. Green Peppers"
echo "8. Onions"
echo "9. Olives"
echo "10. Red Peppers"
echo ""
}

read -p "And what pizza size would you like today? [ 1-10 ]: " toppings

#Loop need for the customer to select another pizza to the order
#Print function needs to be added for the items selected to be printed back
#to the user when selection are made.
