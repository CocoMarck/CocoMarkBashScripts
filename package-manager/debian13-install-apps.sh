#!/bin/bash

# Depende de `debian13-apt-get-apps.sh` y `debian13-prefix.sh`

# Prefix necesarios
source ./debian13-prefix.sh
prefix_glob_files="ls "$prefix_for_app_backup"*"$prefix_file




echo "# Archivos"
for file in $(eval $prefix_glob_files)
do
    echo "- \`$file\`"
done
echo

echo "# Aplicaciones fijas"
remove_apps=$(./debian13-apt-get-apps.sh "remove-apps" )

echo "\`$remove_apps\`"

echo




# Función para instalar app
apt_install(){
    apps=""
    for app in $*
    do
        apps+=" $app"
    done

    echo "sudo apt install $apps -y"
}




echo "# Actualizar y establecer x86 packages"
instruction_compatible_x86="sudo dpkg --add-architecture i386"
instruction_update="sudo apt update"

eval $instruction_compatible_x86
eval $instruction_update

echo





echo "# Aplicaciones seleccionadas"
final_apps=""

for parameter in $*
do
    apps=$( ./debian13-apt-get-apps.sh $parameter )
    final_apps+=" $apps"
    echo "Paquetes: \`"$apps"\`"
done

echo





echo "# Instalar"

echo "Estas son las aplicaciones a instalar:"
echo "\`\`\`"
echo $final_apps
echo "\`\`\`"
echo "Preciona enter continuar, o \`Ctrl+C\` para cancelar..."
read

for app in $final_apps
do
    eval $(apt_install $app)
done

echo





echo "# Borrar"

echo "Estas son las aplicaciones a borrar:"
echo "\`\`\`"
echo $remove_apps
echo "\`\`\`"
echo "Preciona enter continuar, o \`Ctrl+C\` para cancelar..."
read

sudo apt purge $remove_apps -y
sudo apt autoremove -y; sudo apt clean
