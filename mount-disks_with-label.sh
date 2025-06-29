#!/bin/bash
# Este script solo monta los discos con "Label"
echo 'Montar discos de forma automatica'

# Detectar y montar discos no montados
for disk in $(lsblk -lnp | grep "part $" | awk '{print $1}'); do
    # Obtener usuario, si no hay, entonces ponerlo como "public"
    if [ -n "$USER" ]; then
        current_user="$USER"
    else
        current_user="public"
    fi
    echo $current_user

    # Obtener Label, y en base a eso asignar un punto de montaje
    label=$(lsblk -no LABEL $disk)
    mount_point="/media/$current_user/$label"
    echo $disk


    # Detectar tipo de sistema de archivos
    fstype=$(lsblk -no FSTYPE "$disk")
    echo "Tipo de sistema de archivos: $fstype"
    
    # Si el disco tiene un label, se montara (si es que no esta montado)
    if [ -n "$label" ]; then
        echo $label
        echo $mount_point
        if ! mount | grep -q "$mount_point"; then
            sudo mkdir -p "$mount_point"
            echo "Directorio creado"

            # -o umask=000, para que lo pueden leer, escribir y ejecutar, cualquier user.
            if [ "$fstype" = "exfat" ] || [ "$fstype" = "ntfs" ]; then
                # exfat, ntfs
                mount_instruction="sudo mount -t '$fstype' -o uid=1000,gid=1000,fmask=0000,dmask=0000,exec "
                mount_instruction+="'$disk' '$mount_point'"
            else
                # ext4, btrfs. 
                # El `chmod -R 777` sirve para que funque like windows.
                mount_instruction="sudo mount -t '$fstype' '$disk' '$mount_point'; "
                mount_instruction+="sudo chmod -R 777 '$mount_point'"
            fi
            echo "Ejecutano: $mount_instruction"
            eval "$mount_instruction"
            echo "Disco montado"
        fi
    else
        echo 'Unidad sin label'
    fi
    
    # Saltos de linea, para que vea mas bonito.
    echo
    echo
done
