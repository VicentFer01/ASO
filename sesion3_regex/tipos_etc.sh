#!/bin/bash

expresion1='\.conf$'
expresion2='\.bak$'
counter1=0
counter2=0
for list in /etc/* ; do


    if [[ $list =~ $expresion1 ]];
        then
            ((counter1++))
            echo $list
    
    fi


    if [[ list =~ $expresion2 ]];
        then
            ((counter1++))
            echo $list

    fi
done

echo "Archivos .conf: $counter1"
echo "Archivos .bak: $counter2"