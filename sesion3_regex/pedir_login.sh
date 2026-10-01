user_valido=0

re='^[a-z][a-z0-9]*'


while [[ $user_valido -eq 0 ]]; do
    read -p "Introduce el nombre del user: " user
    if [[ $user =~ $re ]];
        then
            if [[ $(grep ^$user /etc/passwd) ]];
                then
                    echo "El user ya existe"
                else
                    echo "El user es valido"
                    user_valido=1
            fi
        else
            echo "user no valido"
    fi         
done               
                




