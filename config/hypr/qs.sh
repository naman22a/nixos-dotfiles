#!/usr/bin/env bash

# Terminate existing quickshell instances gracefully
killall quickshell

# Wait until the processes have been completely shut down
while pgrep -x quickshell >/dev/null; do 
    sleep 0.1
done

# Launch a fresh background instance
quickshell &
