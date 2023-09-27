echo Монтирование дисков

@rem Скрипт автоматического добавление сетевых дисков может быть добавлен к скриптам авторизации на контроллере домена
@rem Удаление сетевых дисков которые могут быть использованы, для устранения возможных конфликтов

@echo Удаление диска "K"
@net use k: /delete

@echo Удаление диска "X"
@net use x: /delete

@echo Удаление диска "P"
@net use p: /delete

@echo Удаление диска "R"
@net use r: /delete

@echo Удаление диска "Y"
@net use y: /delete

@echo Добавление сетевых дисков


@echo Добавление диска "Х" для доступа к программе "Консультант +"
@net use x: \\cons\consplus

@echo Добавление диска "P" для доступа к необходимой общей информации
@net use p: \\law\base


@echo Добавление диска "Y" для доступа к локальной почте
@net use y: \\fsrv\mail
@echo Все диски добавлены
echo System Configuration
tzutil /s "North Asia Standard Time"
powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
cd %systemroot%\system32
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms bu.adm.local:1688
slmgr /ato
netsh advfirewall firewall set rule group="Обнаружение сети" new enable=Yes
netsh advfirewall firewall set rule group="Общий доступ к файлам и принтерам" new enable=Yes
pause
echo Install Apps
echo Install rtDrivers
cd /d "P:\Distrib\ЭЦП\Настройка рабочего места\"
start /wait rtDrivers.exe
echo Done
cd ..
echo CryptoPro-plugin
cd /d "P:\Distrib\ЭЦП\Настройка рабочего места\"
start /wait cadesplugin.exe
echo Done
cd ..
echo Gosuslugi-plugin
cd /d "P:\Distrib\ЭЦП\Настройка рабочего места\"
start /wait IFCPlugin-x64.msi
echo Done
cd ..
echo Install 7-zip
cd /d "P:\Distrib\7zip 19.00"
start /wait 7z1900-x64 /S
echo Done
cd ..
echo Install Yandex.Browser
cd /d "P:\Distrib\ЭЦП\Настройка рабочего места\"
start /wait Yandex.exe
echo Done
cd ..
echo Install K-Lite Codek Pack
cd /d "P:\Distrib\K-Lite Codek Pack 15.6.0\"
K-Lite_Codec_Pack_1560_Full.exe /verysilent
echo Done
cd ..
echo Install Google Chrome
cd /d "P:\Distrib\"
start /wait ChromeStandaloneSetup64.exe
echo Done
echo Install Consplus
cd /d X:
start /wait CONS.exe
pause
echo Done
echo Install ConsplusReg
cd /d "P:\"
copy "P:\ConsultantPlus Region.lnk" "%USERPROFILE%\Desktop\"
pause
echo Done
echo Copy PDF-XChangeViewer to Drive C
robocopy "P:\Distrib\PDF-XChangeViewer" C:\PDF-XChangeViewer /E /NFL /NDL /NJH /NJS /nc /ns /np
cd /d "C:\PDF-XChangeViewer"
set "TargetFile=C:\PDF-XChangeViewer\PDFXCview.exe"
set "ShortcutName=PDFViewer"
set "DesktopFolder=%USERPROFILE%\Desktop"
echo Создание ярлыка...
copy "%TargetFile%" "%DesktopFolder%\%ShortcutName%.lnk" > nul
echo Ярлык успешно создан и скопирован на рабочий стол.
pause
cd ..
echo Done
echo install garant
copy "P:\Гарант Проксима.url" "%USERPROFILE%\Desktop\"
echo Done
echo Install MS Office 2019
cd /d "P:\Distrib\MS Office 2019 Standart"
start Start.bat
pause
:: Удаляем ярлык Почты из панели задач
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d 0200000000000000 /f

:: Удаляем ярлык Microsoft Store из панели задач
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /t REG_BINARY /d 0200000000000000 /f

:: Удаляем ярлык Edge из панели задач
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d 0800000000000000 /f

@echo off

set "DesktopPath=%USERPROFILE%\Desktop"

:: Удаление ярлыка "Google Chrome"
if exist "%DesktopPath%\Google Chrome.lnk" (
    del "%DesktopPath%\Google Chrome.lnk"
    echo Ярлык "Google Chrome" удален.
) else (
    echo Ярлык "Google Chrome" не найден на рабочем столе.
)

:: Удаление ярлыка "Microsoft Edge"
if exist "%DesktopPath%\Microsoft Edge.lnk" (
    del "%DesktopPath%\Microsoft Edge.lnk"
    echo Ярлык "Microsoft Edge" удален.
) else (
    echo Ярлык "Microsoft Edge" не найден на рабочем столе.
)

:: Удаление ярлыка "Yandex"
if exist "%DesktopPath%\Yandex.lnk" (
    del "%DesktopPath%\Yandex.lnk"
    echo Ярлык "Yandex" удален.
) else (
    echo Ярлык "Yandex" не найден на рабочем столе.
)

exit

:: Перезапускаем оболочку Explorer.exe для применения изменений
taskkill /f /im explorer.exe
start explorer.exe