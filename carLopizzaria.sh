
#!/bin/bash
#calls the prompt where app name is
total=0
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
		echo "you pick a small pizza"
		read -p "is this correct (y/n) >>> " selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo "ok small pizza coming up"
			pizzasize='small'
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
		echo "you pick a medium pizza"
		read -p "is this correct (y/n) >>> " selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo "ok medium pizza coming up"
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
		echo "you pick a large pizza"
		read -p "is this correct (y/n) >>>" selector
		if [ "$selector" == "y" ] || [ "$selector" == "Y" ]
			then	
			echo "ok large pizza coming up"
			pizzasize='large'
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
		echo "returning"
	fi
	

done

#When customers order topping
while true 	#loops until customer is finished picking the toppings
do
	clear
	header
	echo "your pizza size is $pizzasize"
	echo " "
	echo "your current toppings >> ${yourpizza[@]}"
	echo " "
	toppings
	#use numbers as selectors for pizza tppping 
	read -p "pick a topping using the number or press x to finish >>> " toppingresponce
	if (( $toppingresponce == 1 ))
	then	#appends the topping to the array(yourpizza)
		echo "you chose to add mushrooms to your pizza"
		yourpizza=("${yourpizza[@]}" "mushroom")
		echo "saving ..."
		sleep 2
	elif (( $toppingresponce == 2 ))
	then
		yourpizza=("${yourpizza[@]}" "onions")
		echo "you chose to add onions to your pizza"
		echo "saving ..."
		sleep 2

	elif (( $toppingresponce == 4 ))
        then
                yourpizza=("${yourpizza[@]}" "pepperoni")
		echo "you chose to add pepperoni to your pizza"
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 3 ))
        then
                yourpizza=("${yourpizza[@]}" "green peppers")
		echo "you chose to add green peppers to your pizza"
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 5 ))
        then
                yourpizza=("${yourpizza[@]}" "suasage")
		echo "you chose to add sausages to your pizza"
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 6 ))
        then
                yourpizza=("${yourpizza[@]}" "bacon")
		echo "you chose to add bacon to your pizza"
                echo "saving ..."
                sleep 2
	elif (( $toppingresponce == 7 ))
        then
                yourpizza=("${yourpizza[@]}" "chicken")
		echo "you chose to add chicken to your pizza"
                echo "saving ..."
                sleep 2

	elif [ $toppingresponce == 'x' ]
	then
		echo "finished adding topping"
		break
	else
		echo "i didnt quite understand what you wrote"
		sleep 1 
	#customer can press x to break loop once he has all the toppings
	fi
done 
# end of toppings 



#prints all the toppings in the array
echo "here are all the topping in your pizza"
#echo ${yourpizza[@]}
echo "$pizzasize......................... 12" >> ../pythonstuff/reciept.txt
echo "additional toppings" >> ../pythonstuff/reciept.txt
for i in "${yourpizza[@]}"
	do
		echo "$i ........................ 1" >> ../pythonstuff/reciept.txt
	done


}
#this function is used to get the customers address when he picks delivery
delivery()
{
header
echo "we need some more infomation before we can continue"
echo " "
while true
do

read -p "what is your street address " address
read -p "what is the city " city
read -p "what is the state " state
read -p "what is your zip code " zip
echo " " 
#confirming the address prompt
echo "saving ...."
sleep 3
header
echo "Showing saved address"
echo " "
echo "$address"
echo "$city, $state $zip"
echo " " 
read -p "is everything correct? y/n " decision

	if [ "$decision" == "y" ] || [ "$decision" == "Y" ]
	then 
		echo "saving address... "
		echo "$address" >> ../pythonstuff/reciept.txt
		echo "$city, $state $zip" >> ../pythonstuff/reciept.txt
		break
	elif [ "$decision" == "n" ] || [ "$decision" == "N" ]
	then echo "Please, Enter new Address. "
	else
		echo "Wrong selection"
fi
done

}

######################################################
# first line of script here 
clear
echo " " > ../pythonstuff/reciept.txt
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
	echo "what would you like to do "
	echo " "
	echo "order selection:"
	echo "1. Delivery "
	echo "2. Carry out"
	#user prompt for delivery or carry out 
	read -p "pick one of the options above using the numbers " typeoforder
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
			delivery
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
clear
echo "lets start your order..."
custompizza

#adding more pizzas
while true
do

	read -p "do you want to continue in adding another pizza (y/n) >>> " selector
	if [ "$selector" == "n" ] || [ "$selector" == "N" ]
		then
		echo "ok lets proced to check out"
		break
	elif [ "$selector" == "y" ] || [ "$selector" == "Y" ]
		then
		echo "ok lets make a new pizza"
		custompizza
	else
		echo "sorry invalid answer "
	fi
done

./payment.sh
cat ../pythonstuff/reciept.txt


