#!/bin/bash 

clear

cat << "EOF"
=====================================
   _____ _                       _   
  / ____| |                     | |  
 | (___ | |__   __ _ _ __   ___| |  
  \___ \| '_ \ / _` | '_ \ / _ \ |  
  ____) | | | | (_| | | | |  __/ |  
 |_____/|_| |_|\__,_|_| |_|\___|_|  
                                   
        S H A D O W  T O O L V2    
=====================================
EOF

while true
do

echo ""
echo "1) Gereken verileri indir (Download required data)"
echo ""
echo "2) Tool Menü (Tool Menu)"
echo ""

read -p "Seçim yap (Make a selection): " secim

if [ "$secim" == "1" ]; then

clear

echo "Paketler güncelleniyor (Updating packages)"
sleep 2

sudo apt update && sudo apt upgrade -y 

clear
echo "Paketler güncellendi ! (Packages updated!)"
echo "Toolar indiriliyor... (Downloading tools...)"
sleep 2

sudo apt install nmap -y && sudo apt install sqlmap -y
sudo apt install cloudflared -y     

sleep 1
clear

echo "Hack toolar indirildi menüye dönülüyor... (Hack tools installed, returning to menu...)"
sleep 2

continue

elif [ "$secim" == "2" ]; then

cd menu 
bash menu.sh

else 
clear

echo "Yanlış seçim menüye dönülüyor... (Wrong selection, returning to menu...)"
sleep 2

continue

fi
done