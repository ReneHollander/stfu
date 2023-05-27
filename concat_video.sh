#!/bin/bash

set -e

add() { n="$@"; bc <<< "${n// /+}"; }

echo "" > data/list_for_ffmpeg.txt
echo "" > data/description.txt

total_duration=0

while IFS=";" read -r filename url
do
  echo "Generating description for $filename"
  duration=$(ffprobe -v error -show_entries format=duration $filename | awk -F= '/duration=/{print $2; exit}')
  echo "file '$filename'" >> data/list_for_ffmpeg.txt
  echo $(printf "%s;%s\n" "$(date -ud "@$(echo "$total_duration" | awk -F"." '{print $1}')" +"%M:%S")" "$url") >> data/description.txt
  total_duration=$(add $total_duration $duration)
done < <(cat data/all_clips.txt | shuf)

ffmpeg -y \
  -f concat -safe 0 -i data/list_for_ffmpeg.txt \
  -c:v libx264 -crf 16 -preset ultrafast \
  -c:a pcm_s32le \
  data/video.mkv

pipenv run ffmpeg-normalize data/video_concatenated.mkv -c:a aac -b:a 320k -o data/video_final.mkv
