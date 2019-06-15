#!/bin/bash

# add /usr/local/scripts/runOnBoot.sh to settings -> applications -> startup


# listen for layout change
/usr/local/scripts/switch_layout.py &

# detach process from shell
disown
