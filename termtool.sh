#!/bin/bash 
# simple menu to do various functions
while [ answer != "0" ]  
do 
clear 
echo "======================================================"
echo "
██████╗ ██████╗    ███████╗███████╗██████╗      ██╗
██╔══██╗██╔══██╗   ██╔════╝██╔════╝██╔══██╗     ██║
██████╔╝██║  ██║   ███████╗█████╗  ██████╔╝     ██║
██╔══██╗██║  ██║   ╚════██║██╔══╝  ██╔══██╗██   ██║
██████╔╝██████╔╝██╗███████║███████╗██║  ██║╚█████╔╝
╚═════╝ ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚════╝ "
echo "======================================================"
echo "Select TOOLS"  
echo "1. Msfconsole" 
echo "2. Sudo" 
echo "3. Nmap" 
echo "4. Sniffer" 
echo "5. MPC" 
echo "0. exit"
read -p " select : " answer 
    case $answer in 
       0) break ;; 
       1) echo "Installing MSF"
       apt update
       apt -y upgrade
       apt -y install git ruby ruby-dev make clang autoconf curl wget ncurses-utils libsqlite-dev postgresql postgresql-dev libpcap-dev libffi-dev libxslt-dev pkg-config
       git clone -b termux https://github.com/timwr/metasploit-framework.git
       cd metasploit-framework
       gem install bundler
       gem install nokogiri -- --using-system-libraries
       bundle install --gemfile Gemfile.local
       echo "If you want start msf (./msfconsole)" 
       ;; 
       2) echo "Installing" 
       pkg install ncurses-utils
       git clone https://github.com/st42/termux-sudo.git
       cd termux-sudo
       cat sudo > /data/data/com.termux/files/usr/bin/sudo
       chmod 700 /data/data/com.termux/files/usr/bin/sudo
       ;; 
       3) echo "Installing"
       apt install nmap 
       ;; 
       4) echo "Installing" 
       git clone git://github.com/hatRiot/zarp.git
       pip install -r requirements.txt
       ;; 
       5) echo "Installing"
       curl -k -L "https://raw.githubusercontent.com/g0tmi1k/mpc/master/msfpc.sh" > /usr/local/bin/msfpc
       chmod 0755 /usr/local/bin/msfpc
       ;;
   esac  
   echo "press RETURN for menu" 
   read key 
done 
exit 0
