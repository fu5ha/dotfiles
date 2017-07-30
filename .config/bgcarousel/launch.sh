#!/usr/bin/env sh

# Terminate already running instances
killall -q bgcarousel

# Wait until the processes have been shut down
while pgrep -x bgcarousel >/dev/null; do sleep 1; done

# Launch carousel
bgcarousel --random
