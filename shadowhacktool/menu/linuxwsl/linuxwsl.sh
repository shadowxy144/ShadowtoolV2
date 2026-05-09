#!/bin/bash

while true
do


clear

echo "S H A D O W T O O L "
echo ""
echo "1) Scanner menü"
echo ""
echo "2) cloudflared menü"
echo ""
echo "3) Gereken verileri indir"
echo ""

read -p "Seçim yap : " secim

if [[ "$secim" == "3" ]]; then

clear

echo "Gereken veriler indiriliyor..."
sleep 2

sudo apt update && sudo apt upgrade -y
sleep 1

sudo apt install nmap -y && sudo apt install cloudflared -y && sudo apt install python -y && sudo apt install whois

clear

echo "Gereken veriler indirildi menüye dönülüyor..."
sleep 2

continue

elif [[ "$secim" == "1" ]]; then

while true
do

clear

echo "S C A N N E R  M E N U "
echo ""
echo "1) Nmap Tarama 1"
echo ""
echo "2) Nmap Tarama 2"
echo ""
echo "3) Nmap Tarama 3"
echo ""
echo "4) menu"
echo ""

read -p "Seçim yap : " secim2
if [[ "$secim2" == "1" ]]; then

clear

read -p "Lütfen bir ip adresi girin : " ip 

clear

echo "Tarama başlatılıyor..."
sleep 2

clear

nmap "$ip"

echo ""
echo "Tarama tamamlandı menüye dönmek için entere basın"
echo ""

read -p "Enter..."
continue


elif [[ "$secim2" == "2" ]]; then

read -p "Lütfen bir ip adresi girin : " ip2

clear


echo "Tarama başlatılıyor..."
sleep 2

clear

nmap -sS -O "$ip2"

echo ""
echo "Tarama tamamlandı menüye dönmek için entere basın"
echo ""

read -p "Enter..."
continue

elif [[ "$secim2" == "3" ]]; then

read -p "Lütfen bir ip adresi girin : " ip3


clear


echo "Tarama başlatılıyor..."
sleep 2

clear

sudo nmap -sS -O -sV "$ip3"

echo ""
echo "Tarama tamamlandı menüye dönmek için entere basın"
echo ""

read -p "Enter..."
continue

elif [[ "$secim2" == "4" ]]; then
break

else
echo "Yanlış seçim tekrar deneyin"
sleep 2
continue

fi
done

elif [[ "$secim" == "2" ]]; then

while true
do

clear

echo "C L O U D F L A R E D  M E N U"
echo ""
echo "1) Cloudflared site "
echo ""
echo "2) Site sorgulama "
echo ""
echo "3) Menü"
echo ""

read -p "Seçim yap : " secim3
if [[ "$secim3" == "1" ]]; then

clear

read -p "Lütfen bir dizin girin : " dizin

cd "$dizin" || { clear; 
echo "[-] Yanlış dizin lütfen tekrar deneyin"; 
sleep 2;
continue; }

clear 

read -p "Lütfen bir port numarası girin : " port

python3 -m http.server "$port" > /dev/null 2>&1 &
sleep 1

echo ""
echo "[*] Local adresiniz : localhost:$port"
echo ""

echo "[*] Siteniz dış dünyaya açılıyor..."
sleep 2

cloudflared tunnel --url localhost:$port > tunnel.log 2>&1 &

sleep 5

link=$(grep -o  'https://[a-zA-Z0-9-]*\.trycloudflare\.com' tunnel.log)
 
clear
echo "Siteniz : $link"

echo ""
echo "Menüye dönmek için entere basın"
echo ""

read -p "Enter..."
continue

elif [[ "$secim3" == "2" ]]; then

clear

read -p "Lütfen taranacak siteyi girin : " tarama

clear

whois "$tarama" | tee whois_sonucu.txt

echo ""
echo "Tarama tamamlandı whois_sonucu.txt kayıt edildi"
echo ""

read -p "Menüye dönmek için entere basın : "
continue


elif [[ "$secim3" == "3" ]]; then

break

else
clear

echo "Yanlış seçim terkrar deneyin "
sleep 2
continue

fi
done

else
clear

echo "Yanlış seçim terkrar deneyin "
sleep 2
continue

fi
done
