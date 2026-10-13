#!/bin/bash

if [[ $# -ne 0 ]];
    then
        sed -E '/^#|^$/d' $1
    else
        echo "no has introducido el parametro"
fi 

