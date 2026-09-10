@echo off
cd /d "%~dp0"
if exist "%USERPROFILE%\Downloads\index.html" (
  move /y "%USERPROFILE%\Downloads\index.html" index.html >nul
  echo [OK] index.html copied from Downloads
)
powershell -NoProfile -Command "$v=Get-Date -Format 'yyyyMMddHHmm'; $p='index.html'; $t=[IO.File]::ReadAllText($p,[Text.Encoding]::UTF8); $t=[regex]::Replace($t,'APP_VERSION=\"\d+\"','APP_VERSION=\"'+$v+'\"'); [IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding($false))); Write-Host ('[OK] version '+$v)"
git add -A
git commit -m "update"
git push
echo.
echo [DONE] check https://ai-june.github.io/foodmap/ in 1 minute
pause
