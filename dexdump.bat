for %%x in (%*) do (
  %~dp0\dexdump.exe -l plain %%x > %%xdump.txt
)