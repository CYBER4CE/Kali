#!/bin/bash

chown -R www-data:www-data /var/www/html

wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
apt-get upgrade && apt-get update

# APACHE CONFIG
a2dismod autoindex #DISABLE DIRECTORY BROWSING
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
apt-get install terminator -y
apt-get install seclists -y
apt-get install ipcalc -y
apt install python3-pip -y
apt-get install masscan -y
apt-get install bettercap -y
apt-get install php-curl -y
apt-get install php-xml -y
apt-get install inspy -y

# PIP PACKAGES
pip3 install raccoon-scanner
pip install shodan

# GIT PACKAGES



#http://0xc0ffee.io/blog/OSCP-Goldmine
#LinEnum.sh - https://netsec.ws/?p=309
#linuxprivcheck.py - python2 https://netsec.ws/?p=309
#linuxprivcheck.py - python3 https://github.com/swarley7/linuxprivchecker
#php reverse shell - http://pentestmonkey.net/tools/web-shells/php-reverse-shell



cd recon


# SKIPTRACER
git clone https://github.com/xillwillx/skiptracer.git
cd skiptracer && chmod +x skiptracer.py
pip install -r requirements.txt
#python skiptracer.py
cd ..


# DISCOVER
git clone https://github.com/leebaird/discover.git


# CTFR
git clone https://github.com/UnaPibaGeek/ctfr.git
cd ctfr && chmod +x ctfr.py
pip3 install -r requirements.txt
#python3 ctfr.py
cd ..


# RED_HAWK
git clone https://github.com/Tuhinshubhra/RED_HAWK
# php rhawk.php
cd ..


# SN1PER
git clone https://github.com/1N3/Sn1per.git
cd Sn1per && chmod +x install.sh
# ./install.sh
cd ..


# XEROSPLOIT
git clone https://github.com/LionSec/xerosploit.git
cd xerosploit && chmod +x install.py
python install.py
# ./xerosploit
cd ..


# HARVESTER
git clone https://github.com/laramies/theHarvester.git
cd theHarvester && chmod +x theHarvester.py
# ./theHarvester.py
cd ..


# OPERATIVE-FRAMEWORK
git clone https://github.com/graniet/operative-framework.git
cd operative-framework && chmod +x operative.py
pip install -r requirements.txt
# ./operative.py
cd ..


# PHOTON
git clone https://github.com/s0md3v/Photon.git
cd Photon && chmod +x photon.py
pip install -r requirements.txt
# python photon.py -u [domain] -l 3 -t 100 --wayback
cd ..



# INSPY
# inspy --empspy /usr/share/inspy/wordlists/title-list-large.txt google



# INFOGA
git clone https://github.com/KyxRecon/Infoga.git
cd Infoga 
pip install -r required.txt
# may have to pip install urlparse2
#./infoga.py
cd ..

# DZGEN
git clone https://github.com/joker25000/DZGEN.git
cd DZGEN && chmod +x DZGEN
# ./DZGEN


# V3N0M-SCANNER
git clone https://github.com/v3n0m-Scanner/V3n0M-Scanner.git
apt-get install python3-dev 
apt-get install python-dev
cd v3n0m-Scanner && chmod +x setup.py
python3 setup.py install --user
cd src && chmod +x v3n0m.py
# python3 v3n0m.py
cd ..
cd ..


cd wireless

#hcxdumptool
git clone https://github.com/ZerBea/hcxdumptool.git
make
make install

#hcxpcaptool
git clone https://github.com/ZerBea/hcxtools
apt-get install libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev
make
make install


#WIFITE2
git clone https://github.com/derv82/wifite2.git
cd wifite2
# python Wifite.py


# FLUXION
git clone https://github.com/FluxionNetwork/fluxion.git 
cd fluxion && chmod +x fluxion.sh
# ./fluxion.sh
cd ..


# AIRGEDDON
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
cd airgeddon && chmod +x airgeddon.sh
# ./airgeddon.sh
cd ..


# WIFIPHISHER
git clone https://github.com/wifiphisher/wifiphisher.git
cd wifiphisher && chmod +x setup.py
# python setup.py install
cd ..

# ROGUEHOSTAPD
https://github.com/wifiphisher/roguehostapd
cd roguehostapd
python setup.py install
cd ..


# BLUEBORNE
git clone https://github.com/ArmisSecurity/blueborne.git
apt-get install libbluetooth-dev
pip2 install pybluez pwn scapy
export PYTHONPATH=$PYTHONPATH:/tools/blueborne
cd ..


# BLUEBORNE MEMORY DUMP POC
git clone https://github.com/Alfa100001/-CVE-2017-0785-BlueBorne-PoC.git
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
git clone https://github.com/pasahitz/zirikatu.git
cd zirikatu && chmod +x zirikatu.sh
apt-get install mono-complete
pip2 install mcs
# ./zirikatu.sh
cd ..


# ETERNALBLUE-DOUBLEPULSAR-METASPLOIT
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit.git
cd ..

cd ..

cd web

#DNSTWIST
https://github.com/elceef/dnstwist.git


#BLACKEYE
git clone https://github.com/thelinuxchoice/blackeye.git

#GHOSTPHISHER

# STRIKER
git clone https://github.com/UltimateHackers/Striker.git
cd Striker && chmod +x striker.py
pip install -r requirements.txt 
# ./striker.py
cd ..

# THE MOLE
apt-get install themole

# SQLiv
git clone https://github.com/Hadesy2k/sqliv.git
cd sqliv
cd sqliv && chmod +x setup.py && chmod +x sqliv.py
# python setup.py -i
# sqliv --help
cd ..


# CUPP
git clone https://github.com/Mebus/cupp.git


# EXIFTOOL
wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.75.tar.gz
tar -xzf Image-ExifTool-10.75.tar.gz
cd Image-ExifTool-10.75
cp -r exiftool lib /usr/local/bin
# exiftool path_to_image
	

# IMPACKET
https://github.com/CoreSecurity/impacket.git
