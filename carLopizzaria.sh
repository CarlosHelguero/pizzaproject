
#!/bin/bash
#calls the prompt where app name is
total=0
lastfunction()
{
while true 
do
	read -p "do you want to make you own pizza now? (y/n) " yesorno
	if [ "$yesorno" == "y" ] || [ "$yesorno" == "Y" ]
	then
		custompizzacall
		break
	elif [ "$yesorno" == "n" ] || [ "$yesorno" == "N" ]
	then 
		echo "ok no worries $name"
		break
	else
			echo "no comprende"
	fi
done
}
custompizzacall()
{
echo "ok $name we shall make your own custom pizza"
		custompizza
		while true
		do
			echo " "
			read -p "do you want to continue in adding another pizza (y/n) >>> " selector
			echo " "
			if [ "$selector" == "n" ] || [ "$selector" == "N" ]
				then
				echo "ALL YOUR PIZZAS HAVE BEEN SAVE $name :)"
				sleep 2
				break
			elif [ "$selector" == "y" ] || [ "$selector" == "Y" ]
				then
				echo "ok lets make a new pizza"
				custompizza
			else
				echo "sorry invalid answer "
			fi
		done
}
header()
{
clear
echo "welcome to JAY C Pizza"
echo "where the best pizza is made!"
echo " "
echo "-------------------------------------------------"
echo " "
}
#calls prompt where  menu items are 
#we dont wanna keep typing this out 
toppings()
{
echo "this is the toppings menu"
echo " "
printf "1. mushrooms,\n2. onions,\n3. green peppers,\n4. pepperoni,\n5. sasuage,\n6. bacon \n7. chicken"
echo " "
}
#function that creates the pizza
custompizza()
{
declare -a yourpizza=() #array where all the chosen topping go into

#start empty beccause because customer hasnt selected any toppings yet
#pizza size selection
while true 
do
	sleep 2
	clear
	header
	echo "pizza sizes"
	echo " "
	echo "1. small 2. Medium 3. large "
	echo " "
	read -p "please pick your size >>>> " pizza
	echo " "
	if (($pizza == 1 ))
		then
		echo " "
		echo "you picked a small pizza"
		echo " "
		read -p "is this correct (y/n) >>> " selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo " "
			echo "ok small pizza coming up"
			pizzasize='small'
			total=$(( total + 8 ))
			printf "\n#########################" >> pythonstuff/reciept.txt
			printf "\nsmall pizza\n....................... 8\n" >> pythonstuff/reciept.txt
			printf "\n#########################" >> pythonstuff/reciept.txt
			#echo "####################" >> pythonstuff/reciept.txt
			sleep 2
			break
		elif [ "$selector" == "n" ] || [ "$selector" == "N" ]
			then	
			echo "returning ..."
		else
			echo "wrong input"
		fi
	elif (($pizza == 2 ))
		then
		echo " "
		echo "you picked a medium pizza"
		echo " "
		read -p "is this correct (y/n) >>> " selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo " "
			echo "ok medium pizza coming up"
			total=$(( total + 10))
			printf "\n#########################" >> pythonstuff/reciept.txt
			printf "\nmedium pizza\n...................... 10\n" >> pythonstuff/reciept.txt
			pizzasize='medium'
			sleep 2 
			break
		elif [ "$selector" == "n" ] || [ "$selector" == "N" ]
			then	
			echo "returning ..."
		else
			echo "wrong input"
		fi
		
		
	elif (($pizza == 3 ))
		then
		echo " "
		echo "you picked a large pizza"
		echo " "
		read -p "is this correct (y/n) >>>" selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo " "
			echo "ok large pizza coming up"
			pizzasize='large'
			total=$(( total + 12 ))
			printf "\n#########################" >> pythonstuff/reciept.txt
			printf "\nlarge pizza\n...................... 12\n" >> pythonstuff/reciept.txt
			printf "\n#########################" >> pythonstuff/reciept.txt
			sleep 2
			break
		elif [ "$selector" == "n" ] || [ "$selector" == "N" ]
			then	
			echo "returning ..."
		else
			echo "wrong input"
		fi
	else
		echo "pizza size not doable"
		echo " "
		echo "returning"
	fi
	

done

#When customers order topping
while true 	#loops until customer is finished picking the toppings
do
	clear
	header
	echo " "
	echo "your pizza size is $pizzasize"
	echo " "
	echo "your current toppings >> ${yourpizza[@]}"
	echo " "
	toppings
	echo " "
	#use numbers as selectors for pizza tppping 
	read -p "pick a topping using the number or press x to finish >>> " toppingresponce
	echo " "
	if (( $toppingresponce == 1 ))
	then	#appends the topping to the array(yourpizza)
		echo "you chose to add mushrooms to your pizza"
		yourpizza=("${yourpizza[@]}" "mushroom")
		echo " "
		echo "saving ..."
		sleep 2
	elif (( $toppingresponce == 2 ))
	then
		yourpizza=("${yourpizza[@]}" "onions")
		echo "you chose to add onions to your pizza"
		echo " "
		echo "saving ..."
		sleep 2

	elif (( $toppingresponce == 4 ))
        then
                yourpizza=("${yourpizza[@]}" "pepperoni")
		echo "you chose to add pepperoni to your pizza"
		echo " "
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 3 ))
        then
                yourpizza=("${yourpizza[@]}" "green peppers")
		echo "you chose to add green peppers to your pizza"
		echo " "
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 5 ))
        then
                yourpizza=("${yourpizza[@]}" "suasage")
		echo "you chose to add sausages to your pizza"
		echo " "
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 6 ))
        then
                yourpizza=("${yourpizza[@]}" "bacon")
		echo "you chose to add bacon to your pizza"
		echo " "
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 7 ))
        then
                yourpizza=("${yourpizza[@]}" "chicken")
		echo "you chose to add chicken to your pizza"
		echo " "
                echo "saving ..."
                sleep 2

	elif [ $toppingresponce == 'x' ]
	then
		echo "finished adding topping"
		break
	else
		echo "I didnt quite understand what you wrote"
		sleep 1 
	#customer can press x to break loop once he has all the toppings
	fi
done 
#end of toppings 
#echo ${yourpizza[@]}
printf "\n    additional toppings" >> pythonstuff/reciept.txt
for i in "${yourpizza[@]}"
	do
		printf "\n$i \n                        1" >> pythonstuff/reciept.txt
		total=$(( total + 1 ))
done


}
#this function is used to get the customers address when he picks delivery
billing()
{
header
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
	echo "Card - ####-####-####-$card"
	echo "Date - $carddate, Code - $cardcode"
	echo " "
	read -p "Does everything look correct? [y or n] " cardconfirm
	echo " "
# Confirming the payment information 
	if [ "$cardconfirm" == "y" ] || [ "$cardconfirm" == "Y" ]
        then 
        echo "Saving card information... "
        sleep 1
		break

	elif [ "$cardconfirm" == "n" ] || [ "$cardconfirm" == "N" ]
		then 
		echo "reenter pls"
		sleep 1
	fi
done
}		 


######################################################
# first line of script here 
clear
echo " " > pythonstuff/reciept.txt
#animated header for pizza
echo "welcome to Carlo Pizza" 
sleep 1 
echo "where the best pizza is made!"
sleep 1
echo " "
echo "-------------------------------------------------"
echo " "
read -p "what is your name? " name
echo " "
echo "hello $name, we are currently out of cheese"
sleep 2
#loop for user selection
#used to filter out bad input and confirmation
while true
do 
	clear
	header
	echo "what would you like to do $name"
	echo " "
	echo "order selection:"
	echo "1. Delivery "
	echo "2. Carry out"
	echo " "
	#user prompt for delivery or carry out 
	read -p "pick one of the options above using the numbers " typeoforder
	echo " "
	#decision process for ordering 
	if (($typeoforder == 1 ))
	then
		#choosing delivery
		echo "you chose a delivery!  "
		#confirmation with yes or no
		#yes breaks the loop 
		#no brings you to the beginning 
		read -p "there is a $ 1000 service fee for delivery continue y/n " selection 
		if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
		then 
			#calls the header prompt
			header
			#calls for the delivery prompt
			
 			#break loops once yes is enter
			#moves on to toppings stage
			break
		
		#choosing no
		#same as before
		elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
		then
			echo "returning to service selection"
			sleep 1 
		else
			echo "wrong selection"
			sleep 1 
		fi
	elif (($typeoforder == 2 ))
	then 
		#choosing a  carryout
		#same logic process from delivery 
		read -p "you chose a carry-out! is this correct? y/n " selection 
		if [ "$selection" == "y" ] || [ "$selection" == "Y" ]
        	then 
			break
        
		elif [ "$selection" == "n" ] || [ "$selection" == "N" ]
        	then
            		echo "returning to service selection"
            		sleep 1 
        	else
            		echo "wrong selection"
            		sleep 1 
        	fi
	else
		echo "wrong selection"
	
	fi

done

while true
do
	clear
	header
	echo "lets start your order..."
	echo " "
	echo "$name, we have some pizza deals available for you"
	read -p "do you want to take a look? (y/n) " yesorno
	if [ "$yesorno" == "y" ] || [ "$yesorno" == "Y" ]
	then
		. specialpizza.sh
		specialtotal=${totalspecial}
		total=$(( total + specialtotal ))
		lastfunction
		break

	elif [ "$yesorno" == "n" ] || [ "$yesorno" == "N" ]
	then	
		custompizzacall
		break
	else
		echo "can you type better!!!"
	fi
done
printf "\n########################" >> pythonstuff/reciept.txt
echo " " >> pythonstuff/reciept.txt

clear 
header 
echo " "
. drinks.sh
drinktotal=${totals}
clear
total=$(( total + drinktotal))
echo "total amount $total" >> pythonstuff/reciept.txt
if (( $typeoforder == 1 ))
then
	./payment.sh
elif (( $typeoforder == 2 ))
then 
	billing

fi

header
echo "generating"
sleep 1 
printf '.'
sleep 1
printf '.'
sleep 1
printf '.'
sleep 1
echo " "
sleep 1
clear
echo "  summary"
cat pythonstuff/reciept.txt
echo "processing"
sleep 1 
printf '.'
sleep 1
printf '.'
sleep 1
printf '.'
sleep 1
echo " "

echo " "
echo "SUCCESS!"
sleep 1
echo "your card has been charged $total.00" 
sleep 1

