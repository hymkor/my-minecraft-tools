@setlocal
@set PROMPT=$D$S$T$G$S

rem (e.g.) set "RESTIC_REPOSITORY=%USERPROFILE%\マイドライブ\restic"

pushd "%APPDATA%"
restic.exe backup ^
    --exclude ".minecraft/backups/*" ^
    --exclude ".minecraft/mods/*" ^
    .minecraft || exit /b 1
pause
restic.exe check  --read-data || exit /b 1
restic.exe forget --keep-last 3 --prune
popd
@endlocal
