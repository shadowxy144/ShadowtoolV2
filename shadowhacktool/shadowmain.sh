#!/bin/bash

while true
do


clear


echo "S H A D O W  T O O L"
echo ""
echo "1) Termux menu"
echo ""
echo "2) Linux , wsl menu"
echo ""
echo "3) Bigli"
echo ""

read -p "Seçim yap : " secim
if [[ "$secim" == "1" ]]; then

bash "menu/termux/termuxmenu.sh"


elif [[ "$secim" == "2" ]]; then

bash "menu/linuxwsl/linuxwsl.sh"


elif [[ "$secim" == "3" ]]; then

clear

echo "Bu bir test tooludur "
echo "Menüye dönmek için entere basın "
echo ""

read -p "Enter..."

clear
continue


else
clear
echo "Yanlış sçeim menüye dönlüyor"
sleep 2
continue

fi
done