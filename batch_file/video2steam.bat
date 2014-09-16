..\ffmpeg\ffmpeg -re -i "html\media\a.mov" -c:v copy -c:a copy -f flv rtmp://127.0.0.1/live1/1080
rem ..\ffmpeg\ffplay rtmp://127.0.0.1/live1/1080

pause