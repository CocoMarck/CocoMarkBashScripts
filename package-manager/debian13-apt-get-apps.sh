#!/bin/bash

# Depende de `get-apps.sh` `debian13-prefix.sh`

# Prefix necesarios
source ./debian13-prefix.sh



# Aplicaciones seleccionadas
# Si existe lo selecciona
final_apps=""

for parameter in $*
do
    debian13_file="$prefix_for_app_backup$parameter$prefix_file"
    final_apps+=$(./get-apps.sh $debian13_file)
done

echo $final_apps
