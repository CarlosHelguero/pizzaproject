#!/bin/bash

totals=0 

soda()
{
echo "1.) Coke         2.00" 
echo "2.) Sprite       2.00" 
echo "3.) Mountain Dew 2.00"
echo "4.) Orange Fanta 2.00" 
echo "5.) Lemonade     1.00" 
echo "6.) Sweet-Tea    1.00"
}

echo "We also have drink options that are available."
echo ""
echo ""
read -p "Would you like to add a drink to your order today? [ y or n ]: " drinks
    if [ "$drinks" == "y" ] || [ "$drinks" == "Y" ]

    then
        echo "Awesome!"

        echo "Take a look at our drink options."
        echo ""
        #soda
        echo ""
            # place drinks menu scricpt here
            while true
           
            do
            
            soda
            read -p "Which drink would you like? [1-6]: " specials
                if (("$specials" == 1))
                then
                        echo "Okay, a coke will be added to your order"
                        echo ""
                        totals=$(( totals + 2 ))
                        echo "Coke 2.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order
                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                       

                        echo "Which soda would you like? [1-6]: "

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
                        echo "Okay, a sprite will be added to your order"
                        echo ""
                        totals=$(( totals + 2 ))
                        echo "Sprite 2.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order

                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                        

                        echo "Which soda would you like? [1-6]: "
                        
                        

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
                        echo "Okay, a moutain dew will be added to your order"
                        echo ""
                        totals=$(( totals + 2 ))
                        echo "Moutain Dew 2.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order

                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                        

                        echo "Which soda would you like? [1-6]: "
                        
                        

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
                elif (("$specials" == 4))
                then
                        echo "Okay, Orange Fanta will be added to your order"
                        echo ""
                        totals=$(( totals + 2 ))
                        echo "Orange Fanta 2.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order

                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                        

                        echo "Which soda would you like? [1-6]: "
                        
                        

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
                elif (("$specials" == 5))
                then
                        echo "Okay, a lemonade will be added to your order"
                        echo ""
                        totals=$(( totals + 1 ))
                        echo "Lemonade 1.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order

                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                        

                        echo "Which soda would you like? [1-6]: "
                        
                        

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
                elif (("$specials" == 6))
                then
                        echo "Okay, a sweet tea will be added to your order"
                        echo ""
                        totals=$(( totals + 1 ))
                        echo "Lemonade 1.00" >> pythonstuff/reciept.txt
                        read -p "Would you like to select another soda? [y or n]:" selection
                        #If the customer want to select another special pizza to add to there order

                        if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
                        then

                        

                        echo "Which soda would you like? [1-6]: "
                        
                        

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
   fi
