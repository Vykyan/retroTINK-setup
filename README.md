WARNING: This script is in testing, once verified it will be listed as such.  You have been warned!

# retroTINK-setup
A Setup script to install RetroTINK configs on a fresh RetroPie v4.3+

HowTo:

Console/SSH into your fresh retropie install.

Type/paste command (All one line)

sudo apt-get install wget git -y && cd /home/pi/ && git clone https://github.com/Vykyan/retroTINK-setup.git && cd retroTINK-setup && chmod +x ./retroTINK-setup.sh && sudo ./retroTINK-setup.sh

Follow Instructions.

# Currently supported Libretro Systems:
 (Not emulator dependant, must be libretro/retroarch core)


atari2600,atari5200,atari7800,atarilynx,fba,fds,gamegear,gb,gba,gbc,genesis/megadrive,mame-libretro,mastersystem,msx,n64,neogeo,nes,ngp,ngpc,pc,pcengine,pcenginecd,psx,sega32x,segacd,snes,supergrafx,virtualboy,wonderswan,wonderswancolor

# Currently supported OTHER emulators/ports:
 (Not 

advmame (relies of advmame inbuilt support for changing resolutions),doom,quake
