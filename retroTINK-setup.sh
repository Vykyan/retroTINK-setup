#!/bin/bash
#
# COMMAND TO RUN FROM PI SSH/TERMINAL;
#
# sudo apt-get install wget git -y && cd /home/pi/ && git clone https://github.com/Vykyan/retroTINK-setup.git && cd retroTINK-setup && chmod +x ./retroTINK-setup.sh && sudo ./retroTINK-setup.sh
#
# Reminder 
# executable files = mode 755
# plain text files = mode 644
#
# Remember to use on files = chown pi:pi
#

# Check for Root Access

killall emulationstation

Check_Root (){
DIALOG_ROOT=${DIALOG=dialog}
me=`basename "$0"`

if [[ $EUID -ne 0 ]]; then
   $DIALOG_ROOT --title  "This script must be run as root" --clear \
   --msgbox "\n\nType:\n\nsudo ./$me" 11 40
   exit 1
fi
}

# Check for Internet Access
Check_Internet () {
DIALOG_INTERNET=${DIALOG=dialog}

wget -q --tries=10 --timeout=20 --spider http://www.google.com
if [[ $? -ne 0 ]]; then
   $DIALOG_INTERNET --title  "No Internet Access!" --clear \
   --msgbox "\n\nPlease connect the Raspberry Pi to the Internet, required to continue setting up RetroTINK..." 11 40
   exit 1
fi
}

Continue_Install (){
clear
# Create Save Dirs
chmod 755 ./makeSaveDirs.sh
./makeSaveDirs.sh
if [[ $? -ne 0 ]]; then
   echo "Error: Could not create Save file Directories!"
fi
chown pi:pi -R /home/pi/RetroPie/savefiles
chown pi:pi -R /home/pi/RetroPie/savestates


#  Copy systems config
chmod 644 ./es_systems.cfg
chown pi:pi ./es_systems.cfg
cp ./es_systems.cfg /etc/emulationstation/

# Copy Runcommands
cd opt-retropie-configs-all
chmod 755 ./runcommand-onend.sh
chown pi:pi ./runcommand-onend.sh
chmod 755 ./runcommand-onstart.sh
chown pi:pi ./runcommand-onstart.sh
cp ./runcommand-onend.sh /opt/retropie/configs/all/
if [[ $? -ne 0 ]]; then
   echo "Error: Could not copy onend script!"
   exit 1
fi
cp ./runcommand-onstart.sh /opt/retropie/configs/all/
if [[ $? -ne 0 ]]; then
   echo "Error: Could not copy onstart script!"
   exit 1
fi
cd ..


cd opt-retropie-configs
chown pi:pi -R ./*
cp -R -f ./* /opt/retropie/configs/
if [[ $? -ne 0 ]]; then
   echo "Error: Could copy retroarch configs!"
   exit 1
fi
cd ..

chown pi:pi -R ./tft-retrotink
cp -R -f ./tft-retrotink /etc/emulationstation/themes/
if [[ $? -ne 0 ]]; then
   echo "Error: Could copy ES Theme!"
   exit 1
fi

#Update Samba Shares
echo '[SaveStates]' >> /etc/samba/smb.conf
echo 'comment = pi' >> /etc/samba/smb.conf
echo 'path = "/home/pi/RetroPie/savestates"' >> /etc/samba/smb.conf
echo 'writeable = yes' >> /etc/samba/smb.conf
echo 'guest ok = yes' >> /etc/samba/smb.conf
echo 'create mask = 0644' >> /etc/samba/smb.conf
echo 'directory mask = 0755' >> /etc/samba/smb.conf
echo 'force user = pi' >> /etc/samba/smb.conf
echo 'follow symlinks = yes' >> /etc/samba/smb.conf
echo 'wide links = yes' >> /etc/samba/smb.conf
echo '[SaveFiles]' >> /etc/samba/smb.conf
echo 'comment = pi' >> /etc/samba/smb.conf
echo 'path = "/home/pi/RetroPie/savefiles"' >> /etc/samba/smb.conf
echo 'writeable = yes' >> /etc/samba/smb.conf
echo 'guest ok = yes' >> /etc/samba/smb.conf
echo 'create mask = 0644' >> /etc/samba/smb.conf
echo 'directory mask = 0755' >> /etc/samba/smb.conf
echo 'force user = pi' >> /etc/samba/smb.conf
echo 'follow symlinks = yes' >> /etc/samba/smb.conf
echo 'wide links = yes' >> /etc/samba/smb.conf

cp -f ./config.txt /boot/config.txt
if [[ $? -ne 0 ]]; then
   echo "Error: Could not copy CONFIG.TXT!"
   exit 1
fi
CURRENTDIR=$PWD
cd ..
rm -R $CURRENTDIR
$DIALOG --title " RetroTINK Installation Script" --clear \
        --yesno "\n\n Installation Complete!  Please reboot your Rasbperry Pi now to use your new RetroTINK enabled RetroPie!\n\nReboot now?" 20 40
case $? in
  0)
    sync;sync;reboot;;
  1)
    exit 0;;
  255)
    exit 0;;
esac
}

Failed_Install (){
   $DIALOG --title  "Install Failed!" --clear \
   --msgbox "\n\nSee log for details..." 20 40
   clear;exit 1
}

Stopped_Install (){
   $DIALOG --title  "Install Canceled!" --clear \
   --msgbox "\n\nExiting..." 20 40
   clear;exit 1
   
}

# Script has Internet and Root access.  Good to go!
Main_Program (){
$DIALOG --title " RetroTINK Installation Script" --clear \
        --yesno "\nThis program will install the needed files & modify some settings to enable the use of the RetroTINK Raspberry Pi HAT with RetroPie (versions 4.3 and above)\n\nWARNING: This script should be run on a fresh installation of RetroPie and may not function properly or at all if changes have been made.\n\nContinue installation?" 20 40
case $? in
  0)
    Continue_Install;;
  1)
    Stopped_Install;;
  255)
    Stopped_Install;;
esac
}

Check_Root
Check_Internet
Main_Program
