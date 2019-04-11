#!/bin/bash

chown -R www-data:www-data /var/www/html

wget -O /root/Pictures/wallpaper.jpeg https://www.hbo.com/content/dam/hbodata/series/game-of-thrones/episodes/7/iced-key-art/got_s7_ka.jpg/_jcr_content/renditions/cq5dam.web.1200.675.jpeg 
wget -O /root/Pictures/lockscreen.jpeg https://wallpapercave.com/download/parrot-security-os-wallpapers-wp2071865

wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
apt-get upgrade && apt-get update

# APACHE CONFIG
# DISABLE DIRECTORY BROWSING
a2dismod autoindex -f
systemctl apache2 restart

# ENABLE BLUETOOTH
systemctl enable bluetooth.service
systemctl start bluetooth.service

mkdir /opt/wireless
mkdir /opt/recon
mkdir /opt/exploit
mkdir /opt/web
mkdir /opt/enumeration
mkdir /opt/shells
mkdir /opt/privesc

# APT PACKAGES
apt-get install terminator seclists ipcalc python3-pip masscan bettercap php-curl php-xml inspy libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev libbluetooth-dev themole -y


# PIP PACKAGES
pip install shodan urlparse2
pip2 install pybluez pwn scapy
pip3 install raccoon-scanner


# GIT PACKAGES
# ---------------------
#      RECON
git clone https://github.com/xillwillx/skiptracer.git /opt/recon
git clone https://github.com/leebaird/discover.git /opt/recon
git clone https://github.com/UnaPibaGeek/ctfr.git /opt/recon
git clone https://github.com/Tuhinshubhra/RED_HAWK /opt/recon
git clone https://github.com/1N3/Sn1per.git /opt/recon
git clone https://github.com/LionSec/xerosploit.git /opt/recon
git clone https://github.com/laramies/theHarvester.git /opt/recon
git clone https://github.com/graniet/operative-framework.git /opt/recon
git clone https://github.com/KyxRecon/Infoga.git /opt/recon
git clone https://github.com/joker25000/DZGEN.git /opt/recon

#      WIRELESS
git clone https://github.com/derv82/wifite2.git /opt/wireless
git clone https://github.com/FluxionNetwork/fluxion.git /opt/wireless
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git /opt/wireless
git clone https://github.com/wifiphisher/wifiphisher.git /opt/wireless
git clone https://github.com/wifiphisher/roguehostapd.git /opt/wireless
git clone https://github.com/ArmisSecurity/blueborne.git /opt/wireless
git clone https://github.com/Alfa100001/-CVE-2017-0785-BlueBorne-PoC.git /opt/wireless
git clone https://github.com/ZerBea/hcxdumptool.git /opt/wireless
git clone https://github.com/ZerBea/hcxtools.git /opt/wireless

#      WEB
git clone https://github.com/elceef/dnstwist.git /opt/web
git clone https://github.com/thelinuxchoice/blackeye.git /opt/web
git clone https://github.com/UltimateHackers/Striker.git /opt/web
git clone https://github.com/Hadesy2k/sqliv.git /opt/web

#      EXPLOIT
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit.git /opt/exploit
git clone https://github.com/pasahitz/zirikatu.git /opt/exploit

#      OTHER
git clone https://github.com/Mebus/cupp.git /opt
https://github.com/CoreSecurity/impacket.git /opt
wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.75.tar.gz /opt


#http://0xc0ffee.io/blog/OSCP-Goldmine
#LinEnum.sh - https://netsec.ws/?p=309
#linuxprivcheck.py - python2 https://netsec.ws/?p=309
#linuxprivcheck.py - python3 https://github.com/swarley7/linuxprivchecker
#php reverse shell - http://pentestmonkey.net/tools/web-shells/php-reverse-shell

cd recon
# SKIPTRACER
cd skiptracer && chmod +x skiptracer.py
pip install -r requirements.txt
#python skiptracer.py
cd ..

# CTFR
cd ctfr && chmod +x ctfr.py
pip3 install -r requirements.txt
#python3 ctfr.py
cd ..

# SN1PER
cd Sn1per && chmod +x install.sh
# ./install.sh
cd ..

# XEROSPLOIT
cd xerosploit && chmod +x install.py
python install.py
# ./xerosploit
cd ..

# HARVESTER

cd theHarvester && chmod +x theHarvester.py
# ./theHarvester.py
cd ..

# OPERATIVE-FRAMEWORK
cd operative-framework && chmod +x operative.py
pip install -r requirements.txt
# ./operative.py
cd ..

# INFOGA
cd Infoga 
pip install -r required.txt

#./infoga.py
cd ..

# DZGEN

cd DZGEN && chmod +x DZGEN
# ./DZGEN



cd wireless

#hcxdumptool

cd hcxdumptool
make
make install
cd ..

#hcxpcaptool

cd hcxtools
make
make install
cd ..


# FLUXION
cd fluxion && chmod +x fluxion.sh
# ./fluxion.sh
cd ..

# AIRGEDDON
cd airgeddon && chmod +x airgeddon.sh
# ./airgeddon.sh
cd ..


# WIFIPHISHER
cd wifiphisher && chmod +x setup.py
# python setup.py install
cd ..

# ROGUEHOSTAPD
cd roguehostapd && python setup.py install
cd ..


# BLUEBORNE
export PYTHONPATH=$PYTHONPATH:/tools/blueborne
cd ..


# BLUEBORNE MEMORY DUMP POC
mv -CVE-2017-0785-BlueBorne-PoC CVE-2017-0785-BlueBorne
cd CVE-2017-0785-BlueBorne && chmod +x CVE-2017-0785.py
# python2 CVE-2017-0785.py TARGET=BLUETOOTH_MAC
cd ..


cd exploit

# KOADIC
#UNICORN
#EMPIRE
#DKMC
#CHAOS
#EASYSPLOIT
#PHANTOM-EVASION
#SPYKEY
#THE-AXER
#VENOM
#IMPACKET
#ROUTERSPLOIT
#AUTOSPLOIT

# ZIRIKATU
cd zirikatu && chmod +x zirikatu.sh
apt-get install mono-complete
pip2 install mcs
# ./zirikatu.sh
cd ..


# ETERNALBLUE-DOUBLEPULSAR-METASPLOIT

cd ..

cd ..

cd web


# STRIKER
cd Striker && chmod +x striker.py && pip install -r requirements.txt 
# ./striker.py
cd ..


# SQLiv
cd sqliv && chmod +x setup.py && chmod +x sqliv.py && python setup.py -i
# sqliv --help
cd ..

# EXIFTOOL
tar -xzf Image-ExifTool-10.75.tar.gz
cd Image-ExifTool-10.75
cp -r exiftool lib /usr/local/bin
# exiftool path_to_image
