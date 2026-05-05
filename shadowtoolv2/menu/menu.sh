#!/bin/bash

clear

cat << "EOF"
=====================================
   _   _            _              _  
  | | | | __ _  ___| | _____ _ __ | | 
  | |_| |/ _` |/ __| |/ / _ \ '_ \| | 
  |  _  | (_| | (__|   <  __/ | | | | 
  |_| |_|\__,_|\___|_|\_\___|_| |_|_| 
                                     
        H A C K  T O O L  M E N U    
=====================================
EOF

while true
do

clear

echo "H A C K  T O O L  M E N U"
echo ""
echo "1) Nmap"
echo ""
echo "2) Sqlmap"
echo ""
echo "3) Cloudflared menu"
echo ""
echo "4) Toolu kapat"

read -p "Seçim yap : " secim 
if [ "$secim" == "1" ]; then

clear

read -p "Taranacak ip adresini girin : " ip 
clear

echo "Tarama başlatılıyor..."
sleep 2

nmap -O -sS -sV -oN sonuc.txt "$ip"

echo ""
echo "Tarama tamamlandı tarama sonucu sonuc.txt dosyasına kayıt edildi"
echo "Menüye dönmek için enter tuşuna basın"
echo ""

read -p "Enter..."
continue

elif [ "$secim" == "2" ]; then

clear

read -p "Lütfen taranacak parametreyi girin : " parametre

clear

echo "Tarama başlatılıyor..."
sleep 1

sqlmap -u "$parametre" --random-agent --batch --crawl=2 --level=2 --risk=2 --dbs > sonuc.txt

echo ""
echo "Tarama tamamlandı tarama sonucu sonuc.txt dosyasına kayıt edildi"
echo "Menüye dönmek için enter tuşuna basın"
echo ""

read -p "Enter..."
continue

elif [ "$secim" == "4" ]; then
exit


elif [ "$secim" == "3" ]; then

while true do

clear

echo "C L O U D  F L A R E D  M E N U"
echo ""
echo "1) Siteyi kur"
echo ""

read -p "Seçim yap : " secim2

if [ "$secim2" == "1" ]; then
clear

read -p "Lütfen bir dosya yolu girin : " dizin

cd "$dizin" || { clear; 
echo "Dizinde bir hata var farklı bir dizin deneyin"; 
sleep 2; 
continue; }

clear
read -p "Lütfen bir port numarası girin : " port


clear

echo "Local ağa açılıyor"
sleep 2

python3 -m http.server "$port" &

clear

echo "Local adresiniz : localhost:$port"
echo "Local ağınız dış dünyaya açılıyor"
sleep 2

cloudflared tunnel --url localhost:$port

echo ""
echo "Menüye dönmek için enter tuşuna basın"
echo ""

read -p "Enter..."
continue




else

clear
echo "Yanlış seçim menüye dönülüyor..."
sleep 2
continue

fi
done


else

clear
echo "Yanlış seçim menüye dönülüyor..."
sleep 2
continue

fi
done