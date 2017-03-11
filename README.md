nginx-rtmp-sample
=================

linux/unix下配置比较容易，相信大家做起来应该比较顺利，再加上网上资料也非常多，而windows下配置会面临更多的问题，所以这里主要在windows下编译的带rtmp的nginx的配置实例..

具体配置搭建过程，也可以参考视频教程操作：
[apache+php与nginx+php环境的搭建](http://www.tudou.com/listplay/jGOJ31wJFck/zLXd5x6Yyy8.html)
[nginx_rtmp在windows下编译及点播,直播,服务端录制的配置](http://www.tudou.com/listplay/jGOJ31wJFck/w-oyi3XnKe0.html)
[ffmpeg+jwplay+nginx负载均衡配置](http://www.tudou.com/listplay/jGOJ31wJFck/W4gXkEeFoiw.html)

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
