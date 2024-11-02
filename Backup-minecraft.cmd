@setlocal
@set PROMPT=$D$S$T$G$S
pushd "%APPDATA%"
restic.exe backup .minecraft  || exit /b 1
restic.exe check  --read-data || exit /b 1
restic.exe forget --keep-last 3 --prune
popd
@endlocal
