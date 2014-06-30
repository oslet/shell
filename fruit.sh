#!/bin/bash

read -p "What is your favorite fruit?: " fruit
case $fruit in
    orange) echo "The $fruit is orange" ;;
    banana) echo "The $fruit is banana" ;;
    pear) echo "The $fruit is pear" ;;
    *) echo "I don't know what color a $fruit is" ;;
    esac
