#!/bin/bash
if [ -z "$1" ]; then
    export WINEPREFIX="$HOME/.wine"
else
    export WINEPREFIX=$1
fi

echo "# Empezando a instalar dlls. Puro copy and paste."
echo "rutita bonita, donde guardar todo morocho: '$WINEPREFIX'"


system32_path=$WINEPREFIX/drive_c/windows/system32
syswow64_path=$WINEPREFIX/drive_c/windows/syswow64

echo "# Copiando todo"
echo "Ruta de dlls 64x: $system32_path"
echo "Ruta de dlls 32x: $syswow64_path"

cp x64/*.dll $system32_path
cp x32/*.dll $syswow64_path

echo "Si no vites ningun error, ta joya todo"
echo "Nomas perciona enter, y dale aceptar a la ventanilla"
read

winecfg