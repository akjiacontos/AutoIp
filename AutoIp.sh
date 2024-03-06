#!/bin/bashuuuuuuuuu

echo "Por favor, introduce la dirección IP estática que deseas asignar:"
read ip_address

echo "                     Por favor, ingresa la contraseña de sudo:"
read -s password

#Añadir autodeteccion de targeta de red#



echo "$password" | sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.backup

#prueba (añadir uno preconfigurado)

echo "network:
  version: 2
  renderer: networkd
  ethernets:
    $interface_name:
      dhcp4: no
      addresses:
        - $ip_address/24" | sudo tee /etc/netplan/01-netcfg.yaml

# Aplica la nueva configuración de red
echo "$password" | sudo netplan apply

echo "La dirección IP estática se ha asignado correctamente."

