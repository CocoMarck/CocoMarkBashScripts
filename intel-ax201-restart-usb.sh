wifi_bluetooth="Intel-AX201"

echo "Reiniciando tarjeta de red $wifi_bluetooth. Pero puede jalar para otros dispositivos bluetooth USB"

echo "Intentando usar rfkill"
sudo rfkill unblock bluetooth; sleep 1

# Reiniciar bluetooth, usar modprobe en medio del reinicio.
sudo systemctl stop bluetooth; sleep 1
sudo modprobe -r btusb; sleep 1
sudo modprobe btusb
sudo systemctl start bluetooth

echo "Terminado"