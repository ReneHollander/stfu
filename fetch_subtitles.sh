#!/bin/bash

mkdir -p data/subtitles
cd data/subtitles

function dl {
    pipenv run yt-dlp --skip-download --write-auto-subs --write-subs --sub-format=json3 -o "%(id)s.%(ext)s" $1
}

dl "https://www.youtube.com/c/CDawgVA/videos"
dl "https://www.youtube.com/c/CDawgVODs/videos"
dl "https://www.youtube.com/c/ConnorDawg/videos"
dl "https://www.youtube.com/channel/UCUc69bOG6m-ujSkI8KWSQoA/videos"
dl "https://www.youtube.com/c/TrashTaste/videos"
dl "https://www.youtube.com/channel/UCKaN3mt53ATqRjzalb2ALFQ/videos"
dl "https://www.youtube.com/c/AbroadinJapan/videos"
dl "https://www.youtube.com/channel/UCuJn_2HhHRqnu3xiIukNx1Q/videos"
