#!/bin/bash

for f in *.flac; do
	ffmpeg -i "${f}" -ab 128k -metadata Album="German IV" "${f%.*}.mp3";
done
