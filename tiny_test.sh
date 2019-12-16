#!/bin/bash
name=tiny
test_count=100

correct=0
failed=0
for (( i=0; i<"$test_count" ; i++ ))
do
    ./sol < "$name"/test"$i".in > tmp
    
    DIFF=$(diff tmp "$name"/test"$i".out) 
    if [ "$DIFF" == "" ]
    then
        ((correct=correct+1))
        echo -e "\e[39m$name $i: \e[92mOK"
    else
        ((failed=failed+1))
        echo -e "\e[39m$name $i: \e[31mZLE"
    fi
done


echo -e "\e[33m$name tests:"
echo -e "\t\e[92mCorrect: $correct"
echo -e "\t\e[31mFailed: $failed"
