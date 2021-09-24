#!/bin/bash

# Special Logic

specialNumberOne(){
totalOne=$(())
}
specialNumberTwo(){
totalTwo=$(($1 + $2))
}
specialNumberThree(){
totalThree=$(($1 + $2))
}



# >>----> Sopranos Pizzeria Specials
echo "1.) 1-Large Pepperoni Pizaa, 1 Large Cheese Pizza, and 1 2-Liter for $24.99" 
echo "2.) 1-Large Meat Lovers Pizza, 1-Medium Cheese Pizza, 1-Medium Pepperoni Pizza, and 2 2-Liter for $27.99" 
echo "3.) 2-Extra Large Cheese Pizza, 1-Large Pepperoni Pizza, and 1-Large Cheese Pizza , 2 2-Liter for $30.99"

read -p "Which one of the special would you like? [1-3]: " specials

