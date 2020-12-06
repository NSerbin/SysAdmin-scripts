#!/bin/bash
# Description   : Información del sistema: nombre de host, espacio en disco, 
#                 memoria, tiempo de actividad y usuarios activos.
# Display hostname of the system.
displayHostName() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** IMFORMACION DEL HOSTNAME ***${DEFAULT_COLOR}"
    hostnamectl
    echo ${BLANK_SPACE}
}
# Display disk space usage of the system.
displayDiskSpace() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** ESPACIO UTILIZADO EN EL DISCO ***${DEFAULT_COLOR}\n"
    df -h
    echo ${BLANK_SPACE}
}
# Display free and used memory of the system.
displayMemory() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** USO DE LA MEMORIA ***${DEFAULT_COLOR}\n"
    free
    echo ${BLANK_SPACE}
}
# Display uptime and load of the system.
displayUpTime() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** ACTIVIDAD Y CARGA DEL SISTEMA ***${DEFAULT_COLOR}\n"
    uptime
    echo ${BLANK_SPACE}
}
# Display active users on the system.
displayUsers() {
    echo -e "${FOREGROUND_COLOR}${BACKGROUND_COLOR}*** USUARIOS ACTIVOS ***${DEFAULT_COLOR}\n"
    who
    echo ${BLANK_SPACE}
}
echo -e "\e[96m================================================\n"
echo -e "\tMostrar información del sistema\n"
echo -e "================================================\e[0m\n"          
echo "Script que muestra información actualizada del sistema."
echo -e "---------------------------------------------------------"
# List options available to the user.
echo -e "\nPuedes optener informacion de las siguientes opciones."
echo -e "(1):\t Mostrar nombre del host"
echo -e "(2):\t Mostrar espacio en disco"
echo -e "(3):\t Mostrar la memoria"
echo -e "(4):\t Mostrar tiempo de actividad y carga"
echo -e "(5):\t Mostrar usuarios activos"
echo -e "(6):\t Mostrar todas las opciones\n"
FOREGROUND_COLOR="\e[97m"
BACKGROUND_COLOR="\e[104m"
DEFAULT_COLOR="\e[0m"
BLANK_SPACE=""
INPUT="s"
while [[ ${INPUT} = "s" ]]
do
    # Prompt the user to choose an option.
    read -p "Selecciona que informacion quieres ver (1-6): " CHOICE
    case ${CHOICE} in 
        1)
            displayHostName
            echo ${BLANK_SPACE};;
        2)
            displayDiskSpace
            echo ${BLANK_SPACE};;
        3)
            displayMemory
            echo ${BLANK_SPACE};;
        4)
            displayUpTime
            echo ${BLANK_SPACE};;
        5)
            displayUsers
            echo ${BLANK_SPACE};;
        6)
            displayHostName
            displayDiskSpace
            displayMemory
            displayUpTime
            displayUsers
            echo ${BLANK_SPACE};;
        *)
            echo -e "You must enter a number between 1-6 ONLY.\n";;
    esac
    # Prompt user if they wish to continue running the script or end it.
    echo "Quieres continuar? Pulsa 'S' o 'N'."
    read INPUT
    if [[ ${INPUT} = "n" ]];
    then
        echo -e ${BLANK_SPACE}
        
    elif [[ ${INPUT} = "s" ]];
    then    
        echo ${BLANK_SPACE}
        continue
    fi
done
exit 0
