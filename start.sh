#! /bin/bash

VBR="1500k"
FPS="24"
QUAL="superfast"

YOUTUBE_URL="rtmp://y.rtmp.youtube.com/live2?backup=1"
KEY="7mcj-k6sx-v5gp-58pk-7jyz"

VIDEO_SOURCE="ee1e540e23c202a8749d804c8d65dc6a.mp4"
AUDIO_SOURCE="https://node-21.zeno.fm/4yk08xmwgs8uv?rj-ttl=5&rj-tok=AAABe5n7btUAB3KCorAp6aOf0A"

ffmpeg \
-re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
-thread_queue_size 512 -i "$AUDIO_SOURCE" \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
-acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
-f flv "$YOUTUBE_URL/$KEY"
