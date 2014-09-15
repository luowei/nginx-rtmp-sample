@echo off  

echo stopping php-cgi...  
taskkill /F /IM php-cgi.exe > nul  

rem echo stopping mysql...  
rem taskkill /F /IM mysqld.exe > nul