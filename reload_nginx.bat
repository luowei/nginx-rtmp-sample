@echo off  
echo reloading nginx...  
RunHiddenConsole ./nginx-rtmp.exe -s reload

exit