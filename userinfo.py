import os, datetime 
from os import system 
from datetime import datetime

def savetolog(firstname,lastname, gpa, email, age):
    path = "log.txt"
    with open(path, 'a') as log:
        
        log.write(f'''
        firstname ............... {firstname}
        lastname ................ {lastname}
        gpa ..................... {gpa}
        email.................... {email}
        age ..................... {age}
        date .................... {datetime.now()}

        ''')
        # log.write(f'\nlastname {lastname}')
        # log.write(f'\nage {age}')
        # log.write(f'\nemail {email}')
        
def inputinfo():
    
    firstname = input("Enter first name >> ")

    lastname = input("Enter last name >> ")

    age = input("Enter your age name >> ")

    email = input("What is your email? >> ")
    gpa = input("Enter ur gpa >> ")
    savetolog(firstname,lastname, gpa, email, age)

while True:

    inputinfo()
    selection = input("do you want to continue (y/n)")
    
    if (selection == 'n' or selection == 'N'):
        break
    elif (selection == 'y' or selection == 'Y'):
        print("\n\nadding another person")
    else:
        print("wrong answer")

    

# def printSuccessOrFail(message):
#     if message == "Success":
#         with open(path, 'a') as log:
#             log.write(f'\nUser {user} tried to log in on {datetime.now()} - Result: {message}') 
#             log.close()
#     else:
#         with open(path, 'a') as log:
#             log.write(f'\nUser {user} tried to log in on {datetime.now()} - Result: {message}')

# if (user == username and password == passwd):
#     print(f'Hello, {user}, you are fully authenticated')
#     printSuccessOrFail("Success")
# else:
#     print("The combination of the username and password you used does not match our records")
#     printSuccessOrFail("Fail")