#!/bin/bash


echo "Please take a moment to take a look at our main menu. "
echo ""


echo "Is there anything that I can get for you today?"
echo ""
echo "1. Small Pizza."
echo "2. Medium Pizza."
echo "3. Large Pizza."
echo "4. Extra Large Pizza."
echo ""
read -p "What pizza size would you like today? [ 1-4 ]: " size
echo ""

echo ""

echo "1. Marinara Sauce"
echo "2. Honey BBQ Sauce"
echo "3. Alfedo Sauce"
echo "4. Garlic Parmesan Sauce"
echo ""
read -p "What type of sauce would you like today? [ 1-4 ]:" sauce
echo ""
echo ""
echo "Pefect! Great selection."
echo ""

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
read -p "And what pizza size would you like today? [ 1-4 ]: " toppings

#Loop need for the customer to select another pizza to the order
#Print function needs to be added for the items selected to be printed back
#to the user when selection are made.
