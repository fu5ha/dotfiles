#!/bin/bash

# Terminate already running instances
killall -q bgcarousel

# Launch carousel
~/Code/go/bin/bgcarousel --random
