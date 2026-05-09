#!/bin/bash

while true
do


clear


echo "S H A D O W  T O O L"
echo ""
echo "1) Termux menu"
echo ""
echo "2)Linux , wsl menu"
echo ""

read -p "Seçim yap : " secim
if [[ "$secim" == "1" ]]; then

cd menu
cd termux

bash termuxmenu.sh


elif [[ "$secim" == "2" ]]; then

cd menu
cd linuxwsl

bash linuxwsl.sh

else
clear
echo "Yanlış sçeim menüye dönlüyor"
sleep 2
continue

fi
done