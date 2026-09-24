#!/bin/bash

bytes_gigas () {
    read -p "Cantidad bytes:" bytes

    gigas=$(echo "scale=2; $bytes / 1073741824" | bc)

    echo "$bytes bytes son $gigas GB"
}

bytes_gigas