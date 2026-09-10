@echo off
chcp 65001 >nul
cd /d "%~dp0"
if exist "%USERPROFILE%\Downloads\index.html" (
  move /y "%USERPROFILE%\Downloads\index.html" index.html >nul
  echo 다운로드 폴더의 index.html 을 가져왔습니다.
)
powershell -NoProfile -Command "$v=Get-Date -Format 'yyyyMMddHHmm'; $p='index.html'; $t=[IO.File]::ReadAllText($p,[Text.Encoding]::UTF8); $t=[regex]::Replace($t,'APP_VERSION=\"\d+\"','APP_VERSION=\"'+$v+'\"'); [IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding($false))); Write-Host ('버전: '+$v)"
git add index.html 올리기.bat
git commit -m "update %date% %time%"
git push
echo.
echo 완료. 1분 뒤 https://ai-june.github.io/foodmap/ 에서 확인
pause
