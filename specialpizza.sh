#!/bin/bash

# Special Logic


totalspecial=0 


# >>----> Sopranos Pizzeria Specials
prompt()
{
clear
echo "welcome to JAY C Pizza"
echo "where the best pizza is made!"
echo " "
echo "-----------------------------------------"
echo " "
echo "     our famous pizza deals "
echo " "
echo "1.) 1-Large Pepperoni Pizza,"
echo "    1 Large Cheese Pizza"
echo "    1 2-Liter        for $ 25.00" 
echo " "
echo "2.) 1-Large Meat Lovers Pizza, "
echo "    1-Medium Cheese Pizza, "
echo "    1-Medium Pepperoni Pizza,"
echo "    2 2-Liter        for $ 28.00" 
echo " "
echo "3.) 2-Large Pepperoni Pizza,"
echo "    2-Large Cheese Pizza"
echo "    2 2-Liter        for $ 31.00"
echo " "
}
echo "    specials " >> pythonstuff/reciept.txt
declare -a deals=()
while true
do

prompt
echo "your current deals"
echo "${deals[@]}"
read -p "Which one of the special would you like? [1-3] or press any other key to cancel: " specials
    if (("$specials" == 1))
    then
        echo "Okay, you have selected special #1"
        totalspecial=$(( totalspecial + 25))
        echo "    1-Large Pepperoni Pizza,"  >> pythonstuff/reciept.txt
        echo "    1 Large Cheese Pizza"  >> pythonstuff/reciept.txt
        echo "    1 2-Liter        for $ 25.00" >> pythonstuff/reciept.txt
        echo " "  >> pythonstuff/reciept.txt
        sleep 1 
        deals=("${deals[@]}" "deal 1")

        
    elif  (("$specials" == 2))
    then
            echo "Okay, you have selected special #2"
            echo "    1-Large Meat Lovers Pizza, " >> pythonstuff/reciept.txt
            echo "    1-Medium Cheese Pizza, " >> pythonstuff/reciept.txt
            echo "    1-Medium Pepperoni Pizza,">> pythonstuff/reciept.txt
            echo "    2 2-Liter        for $ 28.00" >> pythonstuff/reciept.txt
            echo ""
            totalspecial=$(( totalspecial + 28))
            echo " "  >> pythonstuff/reciept.txt
            sleep 1 
            deals=("${deals[@]}" "deal 2")

           
    elif (("$specials" == 3))
    then
            echo "Okay, you have selected special #3"
            echo " "
            totalspecial=$(( totalspecial + 31))
            echo "    2-Large Pepperoni Pizza," >> pythonstuff/reciept.txt
            echo "    2-Large Cheese Pizza"  >> pythonstuff/reciept.txt
            echo "    2 2-Liter       for $ 31.00"  >> pythonstuff/reciept.txt
            #If the customer want to select another special pizza to add to there order
            echo " "  >> pythonstuff/reciept.txt
            sleep 1 
            deals=("${deals[@]}" "deal 3")

    else
    
        echo "Okay, lets continue your order."
        sleep 1 
        break
    fi
echo "your current deals >> ${deals[@]}"
done

#Customer selecting which special 
