#!/bin/bash

# Desacrivar el vsync.
export vblank_mode=0

# Para metele triple buffer a todas las pantallitas.
xrandr |grep ' connected'|cut -f 1 -d ' '|while read display;do xrandr --output $display --set TearFree on;done