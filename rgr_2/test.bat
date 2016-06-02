buildindex1.exe
@echo off
fc F2.TXT F2_ETALON.TXT
if ERRORLEVEL 1 goto Different
echo Test success 
REM подпрограмма, выполн€юща€с€ при совпадении файлов. . .
exit
:Different
echo Test fail
REM подпрограмма, выполн€юща€с€ при различии файлов. . .