#!/bin/bash
#
# Useful data are passed as arguments to these scripts:
#
# $1 - the system (eg: atari2600, nes, snes, megadrive, fba, etc).
# $2 - the emulator (eg: lr-stella, lr-fceumm, lr-picodrive, pifba, etc).
# $3 - the full path to the rom file.
# $4 - the full command line used to launch the emulator.
#

#<h_active_pixels> = horizontal pixels (width)
#<h_sync_polarity> = invert hsync polarity
#<h_front_porch>   = horizontal forward padding from DE acitve edge
#<h_sync_pulse>    = hsync pulse width in pixel clocks
#<h_back_porch>    = vertical back padding from DE active edge
#<v_active_lines>  = vertical pixels height (lines)
#<v_sync_polarity> = invert vsync polarity
#<v_front_porch>   = vertical forward padding from DE active edge
#<v_sync_pulse>    = vsync pulse width in pixel clocks
#<v_back_porch>    = vertical back padding from DE active edge
#<v_sync_offset_a> = leave at zero
#<v_sync_offset_b> = leave at zero
#<pixel_rep>       = leave at zero
#<frame_rate>      = screen refresh rate in Hz
#<interlaced>      = leave at zero
#<pixel_freq>      = clock frequency (width*height*framerate)
#<aspect_ratio>    = *

systemName="$1"
emuName="$2"

case "$systemName" in

"megadrive") # Load Sega Megadrive timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"genesis") # Load Sega Genesis timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"sega32x") # Load Sega 32X timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"segacd") # Load Sega CD timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"mastersystem") # Load Sega Master System timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"gamegear") # Load Sega Game Gear timings
vcgencmd hdmi_timings 1920 1 48 192 280 288 1 3 10 6 0 0 0 59.92 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 288
;;

"atarilynx") # Load Atari Lynx timings
vcgencmd hdmi_timings 1920 1 48 192 240 240 1 3 3 16 0 0 0 59.92 0 37680000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"neogeo") # Load SNK Neo Geo timings
vcgencmd hdmi_timings 1920 1 152 250 280 224 1 13 8 19 0 0 0 59.185 0 40660000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 224
;;

"pcengine") # Load NEC PC Engine timings
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"supergrafx") # Load NEC PC Engine timings
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"nes") # Load NES timings
vcgencmd hdmi_timings 1920 1 160 200 286 224 1 9 8 21 0 0 0 60.10 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 224
;;

"fds") # Load FDS timings
vcgencmd hdmi_timings 1920 1 160 200 286 224 1 9 8 21 0 0 0 60.10 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 224
;;

"snes") # Load SNES timings
vcgencmd hdmi_timings 1920 1 160 200 286 224 1 9 8 21 0 0 0 60.10 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 224
;;

"msx") # Load MSX timings
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"psx") # Load PSX timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 60 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"gb") # Load Game Boy timings
vcgencmd hdmi_timings 1920 1 48 192 280 288 1 3 10 6 0 0 0 59.73 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 288
;;

"gbc") # Load Game Boy Color timings
vcgencmd hdmi_timings 1920 1 48 192 280 288 1 3 10 6 0 0 0 59.73 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 288
;;

"gba") # Load Game Boy Advance timings
vcgencmd hdmi_timings 1920 1 48 192 300 320 1 3 10 6 0 0 0 59.73 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 320
;;

"ngp") # Load SNK Neo Geo Pocket timings
vcgencmd hdmi_timings 1920 1 160 200 228 228 1 9 8 21 0 0 0 60 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 228
;;

"ngpc") # Load SNK Neo Geo Pocket Color timings
vcgencmd hdmi_timings 1920 1 160 200 228 228 1 9 8 21 0 0 0 60 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 228
;;

"atari2600") # Load Atari 2600 timings
vcgencmd hdmi_timings 1920 1 48 192 200 248 1 3 10 6 0 0 0 59.92 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 200
;;

"atari5200") # Load Atari 5200 timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 59.92 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"atari7800") # Load Atari 7800 timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 59.92 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"wonderswan") # Load Bandai Wonderswan timings
vcgencmd hdmi_timings 1920 1 48 192 280 288 1 3 10 6 0 0 0 59.73 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 288
;;

"wonderswancolor") # Load Bandai Wonderswan Color timings
vcgencmd hdmi_timings 1920 1 48 192 280 288 1 3 10 6 0 0 0 59.73 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 288
;;

"virtualboy") # Load Virtual Boy timings
vcgencmd hdmi_timings 1920 1 160 200 286 224 1 9 8 21 0 0 0 60.10 0 40410000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 224
;;

"mame-libretro") # Load MAME Generic 320x240 timings
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"fba") # Load FBAlpha Generic 320x240 timings
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"arcade") # Load Arcade Generic 320x240 timings
if [ "$emuName" != "advmame" ]; then
# Advmame No Res Change
vcgencmd hdmi_timings 1920 1 152 250 280 240 1 3 3 16 0 0 0 59.94 0 40870000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
fi
;;

"n64") # Load Nintendo 64 timings
vcgencmd hdmi_timings=320 1 15 29 40 240 1 10 14 16 0 0 0 60 0 6400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 320 -yres 240
;;

"doom") # Generic 320x240 timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 60 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"quake") # Generic 320x240 timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 60 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

"pc") # Load Generic DOS 320x240 timings
vcgencmd hdmi_timings 1920 1 48 192 240 248 1 3 10 6 0 0 0 60 0 38400000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 1920 -yres 240
;;

esac
