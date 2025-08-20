#!/bin/bash

# Prefix
export WINEPREFIX="$HOME/.wine_gta_v"; 
rm -rf "$WINEPREFIX"; winecfg;

winetricks settings win10
winetricks dxvk2000
winetricks corefonts 
winetricks allfonts
winetricks xact_jun2010
winetricks vcrun2019
winetricks dinput
winetricks dinput8