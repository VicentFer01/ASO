#!/bin/bash

read -p "Escribe la cantidad de bytes" bytes

gigas="slace2; $bytes / 1073741824" | bc

