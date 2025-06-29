#!/bin/bash

# Ruta principal
dir=$(pwd)

# Carpeta a guardar comprimidos
dir_mkv=$dir/compress_mkv

# Detectar si existe una carpeta
if [ -d "$dir_mkv" ]; then
    echo "El directorio existe ($dir_mkv)"
else
    echo "Crear carpeta $dir_mkv"
    mkdir "$dir_mkv"
fi




# Funcion eliminar espacios
source ./logic/text.sh
#echo $(del_space_in_text "Soy un texto sin espacios si o no banda.")




# Función Comprimir archivos.
source ./logic/ffmpeg_bashmode.sh


compress_video $dir $dir_mkv mp4 mkv $1 $2 $3
compress_video $dir $dir_mkv mkv mkv $1 $2 $3
# $1-3 pueden ser -1
# $1-3 son crf fps y resolución




# Mostrar carpetas locas.
echo $dir
echo $dir_mkv