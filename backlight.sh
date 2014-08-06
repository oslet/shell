#!/bin/sh

while read -p "Please input a number(6-20) to control backlight : " backlight
do
    if [ "$backlight" -gt "5" ]; then
        break
    fi
    done
 echo $backlight > /sys/class/backlight/acpi_video0/brightness
