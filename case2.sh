#!/bin/bash
read -p "Which city are you closest to ? : " city
case $city in
    "New York"|London|Paris|Tokyo)
        # You can identify the capital cities and stilll fall through to
        # match the specific country below.
        echo "that is a capital city" ;;&
    Chicago|Detroit|"New Youk"|Washington)
        echo "You are in the USA" ;;
    Longon|Edinburgh|cardiff|dublin)
        echo "You are in the United Kingdom" ;;
    "Ramsey Street")
        echo "You are  in Australia" ;;
    Paris)
        echo "You are in France" ;;
    Tokyo)
        echo "You are in Japan" ;;
    N*)
        # We have already matched "New Youk" and ended it with a ;;
        # so New Youk will not fall through to this test. Other places
        echo "Your work begins with N but is not New York" ;;
    esac
