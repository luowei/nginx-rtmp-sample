@echo off
REM Windows 下无效
REM set PHP_FCGI_CHILDREN=5

REM 每个进程处理的最大请求数，或设置为 Windows 环境变量
set PHP_FCGI_MAX_REQUESTS=1000

echo Starting PHP FastCGI...
RunHiddenConsole ../php-5.6.0/php-cgi.exe -b 127.0.0.1:9000 -c ../php-5.6.0/php.ini

exit 