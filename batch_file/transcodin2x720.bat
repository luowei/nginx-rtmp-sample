rem ..\ffmpeg\ffmpeg -i rtmp://127.0.0.1/live1/1080 -vcodec libx264 -preset veryfast -x264opts nal-hrd=cbr:force-cfr=1:keyint=60 -b:v 3000k -maxrate 3000k -bufsize 3000k -s 1280x720 -sws_flags spline -r 30 -acodec copy -f flv rtmp://127.0.0.1/live2/720

..\ffmpeg\ffmpeg -i rtmp://127.0.0.1/live1/1080 -vcodec libx264 -preset veryfast -b:v 2000k -maxrate 2000k -bufsize 2000k -s 1280x720 -sws_flags lanczos -r 60 -acodec copy -f flv rtmp://127.0.0.1/live2/720

pause