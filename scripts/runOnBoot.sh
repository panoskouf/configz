#!/bin/bash

# add /usr/local/scripts/runOnBoot.sh to settings -> applications -> startup

echo "" >  /home/panoskouf/startup_log.txt

/usr/local/scripts/dropbox.py start

echo "`/usr/local/scripts/dropbox.py status`" > /home/panoskouf/startup_log.txt

# listen for layout change
/usr/local/scripts/switch_layout.py
