#!/bin/bash

# 
# a script to snap photos, time-stamp them, and save them using your raspberry pi
# 
# tested on a Raspberry Pi 2 Model B running a Raspberry Pi 5MP Camera Board Module
# 08-27-2016 [mr]
#
# learn about raspistill 
# https://www.raspberrypi.org/documentation/raspbian/applications/camera.md

current_time=$(date "+%Y-%m-%d_%H.%M.%S")
directory="/var/www/html/camera/"

OUTPUT="${directory}${current_time}.jpg"

# link to the latest snapshot
CURRENT="${directory}00_current.jpg"

# cleanup first: we only want an hour's worth of files in the folder
find /var/www/html/camera -name \*.jpg -type f -mmin +60 -delete;

# fire the camera
/usr/bin/raspistill --nopreview --ISO 800 --width 1024 --height 768 --annotateex 16 -a $current_time --output $OUTPUT --latest $CURRENT

