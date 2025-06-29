#!/bin/bash
# Estas funciones dependenden de FFmpeg

# Función Comprimir archivos.
compress_video () {
    # $1 Carpeta de videos a comprimir
    # $2 Carpeta a guardar videos a comprimir
    # $3 Extencion de videos a comprimir
    # $4 Extención de videos comprimidos
    # $5 CRF
    # $6 FPS
    # $7 Resolución
    cd "$1" || exit # Meterse en la ruta, o cancelar todo.

    number_compress=0
    number_uncompress=0

    for file in *.$3; do
        # Detectar si es file es un archivo y si no lo es, cancela este paso; Pasa el siguiente archivo/paso.
        [ -f "$file" ] || continue




        # Variables necesarias
        new_name="$file.$4" # Nombre comprimido
        compress_path_and_name="$2/$new_name" # Ruta y nombre del nuevo archivo
        uncompress_path_and_name="$1/$file" # Ruto y nombre del archivo a comprimir
        



        # Parametros Argumentos Adicionales
        arguments=""
        
        # CRF
        if [ "$5" != "" ]; then
            if [ "$5" != "-1" ]; then
                arguments="-crf $5"
                echo CRF parametro cambiado
            fi
        else
            arguments="-crf 28"
        fi
        
        # FPS
        if [ "$6" != "" ]; then
            if [ "$6" != "-1" ]; then
                arguments="$arguments -r $6"
                echo FPS parametro cambiado
            fi
        fi

        # Resolucion
        if [ "$7" != "" ]; then
            if [ "$7" != "-1" ]; then
                arguments="$arguments -s $7"
                echo RES parametro cambiado
            fi
        fi

        echo "Argumentos: $arguments"




        # Comprimir o no
        if [ -f "$compress_path_and_name" ]; then    
            echo "El archivo ya fue comprimido: $compress_path_and_name"
            number_compress=$((number_compress+1))
        else
            echo "Comprimiendo archivo: $uncompress_path_and_name"
            ffmpeg -i "$uncompress_path_and_name" $arguments "$compress_path_and_name"
            number_uncompress=$((number_uncompress+1))
            echo "Listo vato, checa que no tenga errores."
        fi
        
        
        
        
        # Mostrar datos importantes
        echo # Salto de linea
        echo "Cantidad de comprimidos archivos $4:      $number_compress"
        echo "Cantidad de no comprimidos archivos $3:   $number_uncompress"
        echo "Total de videos:                          $((number_compress + number_uncompress))"
        echo; echo; echo # Separando comandos con punto y coma. Tres saltos de linea
    done
}