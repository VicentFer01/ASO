#!/bin/bash

mostrar_menu() {
    echo "=== GESTION PROCESOS ===";
    echo "1. Listar procesos user";
    echo "2. Busca proceso por nombre";
    echo "3. Mostrar n procesos por CPU";
    echo "4. Cambiar prioridad";
    echo "5. Finalizar proceso";
    echo "6. Salir";
}


validar_pid() {
    if ps -p $1
}

listar_procesos_user() {
    read -p "User: " user;
    
    if id $user;
        then
            ps -u $user
    else
        echo "Ese user no existe";
    fi
}


buscar_proceso_nombre() {
    read -p "Nombre proceso: " nombre_proceso;

    if ps -C $nombre_proceso;
        then
            ps -C $nombre_proceso
    else
        echo "No existe proceso con ese nombre";
    fi
}

mostrar_procesos_cpu() {
    n=$1

    if [[ -z $n ]];
        then
            n=5
    fi

    if [[ ! $1 =~ ^[1-9]+$ ]];
        then
            echo "Tienen que ser numeros";
            return 1
    fi


    ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n $(($n + 1))

}

cambiar_prioridad() {   
    read -p "PID Proceso: "
}








mostrar_menu
option=0
while [[ $option -ne 6 ]]; do

    read -p "Opcion: " option

    case $option in 
    1) listar_procesos_user ;;
    2) buscar_proceso_nombre ;;
    3) read -p "Total procesos mostrar: " n_procesos 
    mostrar_procesos_cpu $n_procesos ;;
    4) cambiar_prioridad ;;
    5) finalizar_proceso ;;
    6) echo "Saliendo";
       exit 1
    esac

done