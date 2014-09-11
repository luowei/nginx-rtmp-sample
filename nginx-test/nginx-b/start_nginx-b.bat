@echo off
REM Windows 下无效
REM set PHP_FCGI_CHILDREN=5

REM 每个进程处理的最大请求数，或设置为 Windows 环境变量
rem set PHP_FCGI_MAX_REQUESTS=1000

rem echo Starting PHP FastCGI...
rem RunHiddenConsole ../php5.5.11/php-cgi.exe -b 127.0.0.1:9000 -c ../php5.5.11/php.ini

echo Starting nginx...
RunHiddenConsole ./nginx-b.exe -p ./

rem echo starting mysql...  
rem "D:\MySQL\MySQL Server 5.5\bin\mysqld"  
exit 