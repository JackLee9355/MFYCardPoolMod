set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

attrib -R config\lflist.conf
attrib -R cdb\cards.cdb

DEL config\lflist.conf
DEL cdb\cards.cdb

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/welsar55/MFYCardPoolMod/master/lflist.conf', 'config/lflist.conf')"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/welsar55/MFYCardPoolMod/master/lflist.conf -OutFile config/lflist.conf"

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/welsar55/MFYCardPoolMod/master/cards.cdb', 'cdb/cards.cdb')"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/welsar55/MFYCardPoolMod/master/cards.cdb -OutFile cdb/cards.cdb"

attrib +R config\lflist.conf
attrib +R cdb\cards.cdb

PAUSE
EXIT