#!/bin/bash

chown -R www-data:www-data /var/www/html

wget -O /root/Pictures/wallpaper.jpeg https://www.hbo.com/content/dam/hbodata/series/game-of-thrones/episodes/7/iced-key-art/got_s7_ka.jpg/_jcr_content/renditions/cq5dam.web.1200.675.jpeg 
wget -O /root/Pictures/lockscreen.jpeg https://wallpapercave.com/download/parrot-security-os-wallpapers-wp2071865

wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
apt-get upgrade -y && apt-get update -y

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
apt-get install terminator seclists ipcalc python3-pip masscan bettercap php-curl php-xml inspy libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev libbluetooth-dev themole hostapd libnl-3-dev libnl-genl-3-dev mono-complete -y


# PIP PACKAGES
pip install shodan urlparse2
pip2 install pybluez pwn scapy mcs
pip3 install raccoon-scanner


# GIT PACKAGES
# ---------------------

#      WIRELESS
git clone https://github.com/derv82/wifite2.git /opt/wireless/wifite2
git clone https://github.com/FluxionNetwork/fluxion.git /opt/wireless/fluxion
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git /opt/wireless/airgeddon
git clone https://github.com/wifiphisher/wifiphisher.git /opt/wireless/wifiphisher
git clone https://github.com/wifiphisher/roguehostapd.git /opt/wireless/roguehostapd
git clone https://github.com/ArmisSecurity/blueborne.git /opt/wireless/blueborne
git clone https://github.com/Alfa100001/-CVE-2017-0785-BlueBorne-PoC.git /opt/wireless/blueborne-poc
git clone https://github.com/ZerBea/hcxdumptool.git /opt/wireless/hcxdumptool
git clone https://github.com/ZerBea/hcxtools.git /opt/wireless/hcxtools

#      RECON
git clone https://github.com/xillwillx/skiptracer.git /opt/recon/skiptracer
git clone https://github.com/leebaird/discover.git /opt/recon/discover
git clone https://github.com/UnaPibaGeek/ctfr.git /opt/recon/ctfr
git clone https://github.com/Tuhinshubhra/RED_HAWK /opt/recon/redhawk
git clone https://github.com/1N3/Sn1per.git /opt/recon/sniper
git clone https://github.com/LionSec/xerosploit.git /opt/recon/xerosploit
git clone https://github.com/laramies/theHarvester.git /opt/recon/harvester
git clone https://github.com/graniet/operative-framework.git /opt/recon/operative-framework
git clone https://github.com/KyxRecon/Infoga.git /opt/recon/infoga
git clone https://github.com/joker25000/DZGEN.git /opt/recon/dzgen

#      EXPLOIT
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit.git /opt/exploit/eternalblue
git clone https://github.com/pasahitz/zirikatu.git /opt/exploit/zirikatu

#      WEB
git clone https://github.com/elceef/dnstwist.git /opt/web/dnstwist
git clone https://github.com/thelinuxchoice/blackeye.git /opt/web/blackeye
git clone https://github.com/UltimateHackers/Striker.git /opt/web/striker
git clone https://github.com/Hadesy2k/sqliv.git /opt/web/sqliv

#      ENUMERATION
git clone https://github.com/rebootuser/LinEnum.git /opt/enumeration/LinEnum
wget -O /opt/enumeration/LinuxPrivChecker http://www.securitysift.com/download/linuxprivchecker.py

#      SHELLS
wget -O /opt/shells/php http://pentestmonkey.net/tools/php-reverse-shell/php-reverse-shell-1.0.tar.gz

#      OTHER
git clone https://github.com/Mebus/cupp.git /opt/cupp	
git clone https://github.com/CoreSecurity/impacket.git /opt/impacket
wget -O /opt/exiftool https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.75.tar.gz


# INSTALL
# -----------------------

#hcxdumptool
cd /opt/wireless/hcxdumptool
make
make install

#hcxpcaptool

cd /opt/wireless/hcxtools
make
make install

# FLUXION
cd /opt/wireless/fluxion && chmod +x fluxion.sh && ./fluxion.sh
# ./fluxion.sh

# AIRGEDDON
cd /opt/wireless/airgeddon && chmod +x airgeddon.sh && ./airgeddon.sh

# WIFIPHISHER
cd /opt/wireless/wifiphisher && chmod +x setup.py && python setup.py install

# ROGUEHOSTAPD
cd /opt/wireless/roguehostapd && chmod +x setup.py && python setup.py install


# SKIPTRACER
cd /opt/recon/skiptracer && chmod +x skiptracer.py && pip install -r requirements.txt

# CTFR
cd opt/recon/ctfr && chmod +x ctfr.py && pip3 install -r requirements.txt

# SN1PER
cd opt/recon/sniper && chmod +x install.sh && ./install.sh

# XEROSPLOIT
cd opt/recon/xerosploit && chmod +x install.py && python install.py

# HARVESTER
cd opt/recon/harvester && chmod +x theHarvester.py && ./theHarvester.py

# OPERATIVE-FRAMEWORK
cd opt/recon/operative-framework && chmod +x operative.py && pip install -r requirements.txt

# INFOGA
cd opt/recon/infoga && pip install -r required.txt && ./infoga.py

# DZGEN
cd opt/recon/dzgen && chmod +x DZGEN && ./DZGEN


cd /opt/exploit

#KOADIC
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
cd /opt/exploit/zirikatu && chmod +x zirikatu.sh && ./zirikatu.sh



# ETERNALBLUE-DOUBLEPULSAR-METASPLOIT

# STRIKER
cd /opt/web/striker && chmod +x striker.py && pip install -r requirements.txt 

# SQLiv
cd /opt/web/sqliv && chmod +x setup.py && chmod +x sqliv.py && python setup.py -i
# sqliv --help


# EXIFTOOL
cd /opt/exiftool && tar -xzf Image-ExifTool-10.75.tar.gz
cd Image-ExifTool-10.75
cp -r exiftool lib /usr/local/bin
