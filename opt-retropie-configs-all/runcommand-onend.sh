#!/bin/bash
#
# Change Screen mode back
#
# hdmi_timings=480 1 14 45 56 300 1 10 5 5 0 0 0 60 0 9600000 1
#

clear

# 450 x 270
vcgencmd hdmi_timings 450 1 50 30 90 270 1 1 1 30 0 0 0 50 0 9600000 1
tvservice -e "DMT 87"
fbset -depth 32 && fbset -depth 32 -xres 450 -yres 270


clear
