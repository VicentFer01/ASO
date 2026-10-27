#!/bin/bash

mostrar_menu() {
    echo "==== GESTION DE PROCESOS ===="
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Procesos con mas CPU"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"
}


listar_procesos_user() {
    echo "Introduce user: "
    read -p "User: " user
    ps -u $user
}

buscar_proceso_user() {
    read -p "Nombre proceso": nombre_proceso;
    ps -C $nombre_proceso
}

cambiar_prioridad() {
    read -p "Nueva prioridad: " prioridad
    read -p "PID Proceso: " pid_prioridad

    renice -n $prioridad -p $pid_prioridad
}

mostar_procesoCPU() {
    ps -eo pid,user,%cpu,comm --sort=-%cpu
}


finalizar_proceso() {
    read -p "PID Proceso: " pid_matar;
    kill $pid_matar
}


while [[ $option -ne 6 ]]; do
        mostrar_menu

        read -p "Opcion: " option;

        case $option in

        1) listar_procesos_user ;;
        2) buscar_proceso_user ;;
        3) mostar_procesoCPU ;;
        4) cambiar_prioridad ;;
        5) finalizar_proceso ;;
        6) echo "Saliendo";
            ;;
        *) echo "Opcion no valida";
        esac
            
done

