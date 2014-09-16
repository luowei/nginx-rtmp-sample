nginx-rtmp-sample
=================

在windows下编译的带rtmp的nginx的配置实例..


###Transcoding streams

    Encoding\ffmpeg -i rtmp://127.0.0.1/live1/1080 -vcodec flv -acodec copy -s 360x360 -f flv rtmp://127.0.0.1/live3/480
    pause

    Encoding\ffmpeg -i rtmp://127.0.0.1/live1/1080 -vcodec libx264 -preset veryfast -x264opts nal-hrd=cbr:fore-cfr=1:keyint=60 -b:v 3000k -bufsize 3000k -s 1280x720 -sws_flags spline -r 30 -acodec copy -f flv rtmp://127.0.0.1/live2/720
    pause

--------


    ffmpeg -i rtmp://127.0.0.1/big/1080 -vcodec libx264 -preset faster -x264opts nal-hrd=cbr:force-cfr=1:keyint=60 -b:v 3000k -maxrate 3000k -bufsize 3000k -s 1280x720 -sws_flags spline -r 30 -acodec copy -f flv rtmp://127.0.0.1/small/720

    ffmpeg -i rtmp://127.0.0.1/big/1080 -vcodec libx264 -preset veryfast -b:v 2000k -maxrate 2000k -bufsize 2000k -s 1280x720 -sws_flags lanczos -r 60 -acodec copy -f flv rtmp://127.0.0.1/small/720

    ffmpeg -i rtmp://127.0.0.1/big/1080 -vcodec flv -acodec copy -s 64x64 -f flv rtmp://127.0.0.1/small/720

--------
###Stream your X screen through RTMP

    ffmpeg -f x11grab -follow_mouse centered -r 25 -s cif -i :0.0 -f flv rtmp://127.0.0.1/live1/screen