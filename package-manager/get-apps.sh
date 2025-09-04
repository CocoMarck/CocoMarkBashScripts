#!/bin/bash

# Prefix necesarios
prefix_for_grep="^#|^$"
instruction_grep_apps="grep -vE '$prefix_for_grep'"

# Aplicaciones seleccionadas
# Si existe lo selecciona
final_apps=""

for file in $*
do
    if [ -f $file ]; then
        # - **Existe \`$debian13_file\`**

        apps=$(eval "$instruction_grep_apps $file")
        final_apps+=" $apps"
        # Paquetes: \`"$apps"\`
    fi
done

echo $final_apps
