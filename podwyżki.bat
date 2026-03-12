@echo off
REM -----------------------------
REM Symulacja ataku - tryb bezpieczny z logowaniem do sieci
REM -----------------------------

REM Ścieżka do pliku HTML
set "TARGET=https://olmedica.pl/atak_test/test_atak.html"

REM Ścieżka do pliku logu na udziale sieciowym
set LOGFILE=\\dc1\test_atak$\uruchomienia_log.csv

REM Pobranie daty i godziny
for /f "tokens=1-3 delims=/:. " %%a in ("%date% %time%") do set DATETIME=%date% %time%

REM Zapis do logu: data, godzina, użytkownik, komputer
echo "%DATETIME%","%USERNAME%","%COMPUTERNAME%" >> "%LOGFILE%"

REM --- Wygląd konsoli ---
title [SYMULACJA ATAKU]
color 0C
mode con: cols=120 lines=40
cls

REM --- Uruchomienie Edge w trybie kiosk ---
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --kiosk "%TARGET%" --edge-kiosk-type=fullscreen --no-first-run --disable-infobars

exit /b 0
