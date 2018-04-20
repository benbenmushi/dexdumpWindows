set "tempFolder=%tmp%\bat~%RANDOM%"

for %%x in (%*) do (
 echo "%%~nx"
 "C:\Program Files\7-Zip\7z.exe" e "%%x" "-o%tempFolder%" *.dex -r -aoa
 for %%i in (%tempFolder%\*.dex) do (
 if not exist "%%~dpnx_dexdump" mkdir "%%~dpnx_dexdump"
  %~dp0\dexdump.exe -l plain "%tempFolder%\%%~nxi" > "%%~dpnx_dexdump\%%~nxidump.txt"
)
 %SystemRoot%\explorer.exe "%%~dpnx_dexdump"
)
