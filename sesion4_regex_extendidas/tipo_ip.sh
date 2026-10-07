#!/bin/bash


re_loopback='^127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
re_priv1='^192\.168\.[0-9]{1,3}\.[0-9]{1,3}$'
re_priv2='^10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
re_priv3='^172\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'


if [[ $# -ne 0 ]];   
    then
        if [[ $1 =~ $re_loopback ]];
            then
            echo "La ip es de loopback"
        fi    

        if [[ $1 =~ $re_priv1 || $1 =~ $re_priv2 || $1 =~ $re_priv3 ]];
            then
            echo "La ip es privada"
        fi
            
        else
            echo "La ip es publica"
fi                
    
