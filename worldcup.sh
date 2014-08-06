#!/bin/bash

function arrangegames
{
    played=`mktemp`
    grep -v "^*** Group " /tmp/group${group} | while read team
    do
        # can't play against yourself
        grep -v "^${team}$" /tmp/group${group} | grep -v "^*** Group " | while read opponent
        do
            grep "^${opponent} vs ${team}$" $played > /dev/null
            if [ "$?" -ne "0" ]; then
                echo "$team vs $opponent" | tee -a $played
                fi
            done
        done
    rm -f $played
}

##################### Script Starts here ##############################################
teams=teams.txt
randomized=`mktemp`
numteams=`wc -l $teams | awk '{print $1}'`
numgroups=4

# each group must have an even number of teams
teamsingroup=`echo "$numteams / $numgroups" | bc`
echo "scale=1; $teamsingroup / 2" | bc | grep "\.0$" > /dev/null 2>&1
if [ "$?" -ne "0" ]; then
    echo "$numteams does not divide into $numgroups groups neatly."
    exit 1
    fi

shuf $teams > $randomized

for group in `seq 1 $numgroups`
do
    echo "*** Group $group ***" > /tmp/group${group}
    grouphead=`expr $group \* $teamsingroup`
    head -$grouphead $randomized | tail -$teamsingroup >> /tmp/group${group}
    done
echo "Groupings:"
echo

for group in `seq 1 $nmgroups`
do
    echo "*** Qualifying games in Group $group ***"
    # Randomizing the order gives the teams more of a break.
    arrangegames $group | shuf |pr -t -c2
    echo
    done
