#!/usr/bin/env bash

# This script slightly moves your mouse at random times and random ammounts. To
# do so, the script needs [ydotool](https://github.com/ReimuNotMoe/ydotool)
# installed.
#
# Time period between mouse movements is between 0 and 2 min and the mouse gets
# moved between -10 and 10 pixels in both x and y directions.


set -ueo pipefail

ydotoold &
daemon_pid=$!
trap 'kill "$daemon_pid" 2>/dev/null || true; wait "$daemon_pid" 2>/dev/null || true && echo -e "\nKilled ydotoold at PID $daemon_pid"' EXIT

until ydotool mousemove -x 0 -y 0 >/dev/null; do
    sleep 0.1
done


while true; do
    ydotool mousemove -x $(($RANDOM % 20 - 10)) -y $(($RANDOM % 20 - 10))
    sleep $(($RANDOM % 120))
done
