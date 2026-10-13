#!/bin/bash

if [[ $# -ne 0 ]];
    then
        sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/x.x.x.x/g' > acesos.log.anonimo   $1
    else
        echo "no has introducido el parametro"
fi 
