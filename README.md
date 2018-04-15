NOTE: Confirmed working on RetroPie v4.3 and v4.4!! :D

# retroTINK-setup (Should work for RGB-Pi users as well!)
A Setup script to install RetroTINK configs on a fresh RetroPie v4.3+

These all are setup for my Sony Trinitron KV-AR29M31 via Component input.  Most are pixel perfect resolutions with correct timing/clocks.

A few were just too small on my screen for proper pixel perfect integer scaling, so i've done a little messing around so they look good with hardware scanlines but fill more of the screen.

# HowTo:

Console/SSH into your fresh retropie install.

(NOTE: ssh can be enabled by either placing a blank ssh file in /boot/ or by configuring it from HDMI emulationstation before running this script).

Type/paste command (All one line)

`sudo apt-get install wget git -y && cd /home/pi/ && git clone https://github.com/Vykyan/retroTINK-setup.git && cd retroTINK-setup && chmod +x ./retroTINK-setup.sh && sudo ./retroTINK-setup.sh`

Follow Instructions. (Make sure to change emulationstation theme to "tft-retrotink" once back in Emulationstation after reboot!

# Currently supported Libretro Systems:
 (Not emulator dependant, must be libretro/retroarch core)
 (Ex: snes will catch any SNES libretro core, ie, lr-snes9x,lr-pocketsnes etc)

atari2600,atari5200,atari7800,atarilynx,fba,fds,gamegear,gb,gba,gbc,genesis/megadrive,mame-libretro,mastersystem,msx,n64,neogeo,nes,ngp,ngpc,pc,pcengine,pcenginecd,psx,sega32x,segacd,snes,supergrafx,virtualboy,wonderswan,wonderswancolor

# Currently supported OTHER emulators/ports:

advmame (relies of advmame inbuilt support for changing resolutions),doom,quake
