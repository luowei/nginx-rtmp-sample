rem Stream your X screen through RTMP

rem ..\ffmpeg\ffmpeg -f x11grab -follow_mouse centered -r 25 -s cif -i :0.0 -f flv "rtmp://127.0.0.1/live1/1080"


rem ..\ffmpeg\ffmpeg -f x11grab -s 1600¡Á1200 -r 20 -i :0.0 -f alsa -ac 2 -i hw:0,0 -vb 20 -vcodec libx264 -threads 0 -acodec libmp3lame -ab 128k -ar 22050 -f flv ¡°rtmp://127.0.0.1/live1/1080¡±

rem ..\ffmpeg\ffmpeg -y -loglevel warning -f dshow -i video="screen-capture-recorder" -vf crop=690:388:136:0 -r 30 -s 962x388 -threads 2 -vcodec libx264 -vpre baseline -vpre my_ffpreset -f flv rtmp://127.0.0.1/live1/1080

rem ..\ffmpeg\ffmpeg -f dshow -i video="Virtual-Camera" -vcodec libx264 -tune zerolatency -b 900k -f mpegts rtmp://127.0.0.1/live1/1080

rem ..\ffmpeg\ffmpeg -f dshow -i video="screen-capture-recorder":audio="Stereo Mix (IDT High Definition" -vcodec libx264 -preset ultrafast -tune zerolatency -r 10 -async 1 -acodec libmp3lame -ab 24k -ar 22050 -bsf:v h264_mp4toannexb -maxrate 750k -bufsize 3000k -f mpegts rtmp://127.0.0.1/live1/1080

rem ..\ffmpeg\ffmpeg -f x11grab -s 1920x1200 -r 15 -i :0.0 -c:v libx264 -preset fast -pix_fmt yuv420p -s 1280x800 -threads 0 -f flv "rtmp://127.0.0.1/live1/1080"

rem the following command will generate a signal, and will stream it to the port 1234 on localhost:
rem ..\ffmpeg\ffmpeg -re -f lavfi -i aevalsrc="sin(400*2*PI*t)" -ar 8000 -f mulaw -f rtp rtmp://127.0.0.1/live1/1080

rem To play the stream with ffplay (which has some caveats, see above), run the command:
rem ..\ffmpeg\ffplay rtmp://127.0.0.1/live1/1080

pause