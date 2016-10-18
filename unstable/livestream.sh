#!/bin/bash
trap 'kill -9 $PID 2>/dev/null' EXIT

livestreamer -O "$1" best | /usr/bin/avconv -v quiet -i pipe:0 -acodec copy -vcodec copy -bsf h264_mp4toannexb -tune zerolatency -f mpegts pipe:1

PID=$!
wait $PID
