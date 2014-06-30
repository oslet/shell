#!/bin/bash
# Fibonacci number shell script
# It takes input multiple numbers and show Fibonacci number of those serial
# It stops taking input when -1 is given

# Prompts for an input
echo -n "Which fibonacci number do u want to see? (Enter -1 to exit) "

# Read the number
read nSerial

# Loops until -1 is given as input
while [ $nSerial -ne -1 ]; do # Checks whether nSerial is not equal to -1
        # Initializes variables
        a=0
        b=1
        count=1 # Used to control the number of iteration of the while loop
        fibonacci_number=$a

        # The loop to calculate the number
        while [ $count -le $nSerial ]; do # Checks whether count is less than or equal to nSerial
                fibonacci_number=$[$a+$b]
                a=$b
                b=$fibonacci_number
                count=$[$count + 1]
        done

        # Print the output
        echo "Fibonacci $nSerial = $fibonacci_number"

        # Prompts for an input
        echo -n "Which fibonacci number do u want to see? (Enter -1 to exit) "

        # Read the number
        read nSerial
done
