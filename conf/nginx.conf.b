
worker_processes  1;
error_log  logs/rtmp_error.log debug;
pid			logs/nginx.pid;

events {
    worker_connections  1024;
}

http {
	access_log		logs/rtmp_access.log;
    include       mime.types;
    default_type  application/octet-stream;

	allow all;
    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       8001;
        server_name  localhost;

				
        location / {
            root   html;
            index  index.html index.htm;
        }
		
		# rtmp stat
		location /stat {
			rtmp_stat all;
			rtmp_stat_stylesheet stat.xsl;
		}
		location /stat.xsl {
			# you can move stat.xsl to a different location
			root html;
		}
		# rtmp control
		location /control {
			rtmp_control all;
		}

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

    }

}


rtmp {
	server {
	listen 1935;
	chunk_size 4096;
	
	application live1 {
		allow publish 192.168.31.0/24;
		deny publish all;
		allow play 192.168.31.0/24;
		deny play all;
		live on;
		meta copy;
		record all;
		record_suffix -%Y-%m-%d-%H%M.flv;
		record_path html/media/record;
	}
	application live2 {
		allow publish 192.168.31.0/24;
		deny publish all;
		allow play 192.168.31.0/24;
		deny play all;
		live on;
		meta copy;
		push rtmp://192.168.31.230/live3/1080;
	}
	}
}
