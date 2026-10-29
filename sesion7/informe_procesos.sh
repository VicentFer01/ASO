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



validar_pid() {
    if ps -p $pid_prioridad;
        then
            return 0
    else
            return 1
    fi 
}


listar_procesos_user() {
    read -p "User: " user

    if id "$user"; 
        then
            echo "User existe";
            ps -u "$user"
    
    else
        echo "Ese user no existe";
    fi
}

buscar_proceso_user() {
    read -p "Nombre proceso": nombre_proceso;

    if ps -C $nombre_proceso;
        then
            echo "Se han encontrado matches";
    else
        echo "No existen procesos con ese nombre";
    fi
}

cambiar_prioridad() {
    read -p "Nueva prioridad: " prioridad
    read -p "PID Proceso: " pid_prioridad

    if validar_pid "$pid_prioridad"; 
        then
            if [[ $EUID -eq 0 ]]; 
                then
                    if (( prioridad >= -20 && prioridad <= 19 )); 
                        then
                            renice --priority "$prioridad" -p "$pid_prioridad"
                    else
                        echo "La prioridad para root debe estar entre -20 y 19"
                    fi

            else
                if (( prioridad >= 0 && prioridad <= 19 )); 
                    then
                        renice --priority "$prioridad" -p "$pid_prioridad"
                else
                    echo "La prioridad debe estar entre 0 y 19"
                fi

            fi

    else
        echo "Ese PID no existe"
    fi
}

mostar_procesoCPU() {
    ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 10
}   


finalizar_proceso() {
    read -p "PID Proceso: " pid_matar;
    read -p "Seguro que quieres acabar el proceso (s/n) " confirmar;


    if validar_pid "$pid_prioridad"; 
        then
            if [[ $confirmar == "s" ]];
                then
                    kill $pid_matar
                    echo "Se ha matado el proceso $pid_matar ";
            elif [[ $confirmar == "n" ]];
                then
                    echo "Cancelando..";
            else
                echo "Opcion no valida";
            fi
    else
        echo "No existe es PID";
    fi
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

