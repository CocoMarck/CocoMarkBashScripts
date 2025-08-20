#!/bin/bash

export WINEPREFIX="$HOME/.wine_gta_v"; 

dir=$(pwd)
game=$dir"/PlayGTAV.exe"
echo "Directorio de juego"; echo $game

exec_instruction="WINEDLLOVERRIDES=\"dinput8=n,b\" wine \"$game\""
echo "Instrucción a ejecutar"; echo $exec_instruction
eval $exec_instruction

echo "Listo..."