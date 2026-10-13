#!/bin/bash

if [[ $# -ne 0 ]];
    then
        sed -E 's/@gmail.com$|@hotmail.com$/@alu.edu.gva.es/' $1
    else
        echo "no has introducido el parametro"
fi 

