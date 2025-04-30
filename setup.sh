#!/data/data/com.termux/files/usr/bin/bash

# === Colors ===
green="\e[32m"
yellow="\e[33m"
red="\e[31m"
cyan="\e[36m"
end="\e[0m"

clear

# === Display Banner ===
echo -e "${yellow}====================================="
echo -e "${green}   ZeroDark Nexus - PageKite Setup  "
echo -e "${yellow}====================================="
echo -e "${cyan}Welcome to ZeroDark Nexus Setup!${end}"

# === Install dependencies ===
echo -e "${green}Installing required dependencies...${end}"
pkg update -y && pkg upgrade -y
pkg install python python3 git curl -y

cd $HOME
# === Download PageKite ===
echo -e "${green}Downloading PageKite...${end}"
curl -O https://pagekite.net/pk/pagekite.py

# === Configure PageKite Subdomain ===
echo -e "${cyan}Please enter your PageKite subdomain:${end}"
read -p "Subdomain: " subdomain

# === Save Subdomain in Hidden File ===
echo -e "$subdomain" > .subdomain.txt

# === Display Success Message ===
echo -e "${green}Subdomain $subdomain saved successfully!${end}"
cd pagekite
chmod +x pagekite delete-pagekite
mv pagekite delete-pagekite $PREFIX/bin/
echo -e "\e[92m Installed Successfully and type pagekite[\e[34m✓\e[92m]\e[34m"
cd
echo -e "\e[92m~\e[0m $ .....\e[92mSUBSCRIBE My YOUTUBE Channel\e[0m.....\e[94m[\e[92m✓\e[94m]\e[0m"
rm -rf pagekite
python3 pagekite.py 8080 $subdomain
termux-open-url https://youtube.com/@zerodarknexus