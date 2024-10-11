@echo off
:: Отключаем вывод команд для улучшения читаемости

echo Монтирование дисков

:: Удаление ранее подключенных сетевых дисков
echo Удаление диска "K"
@net use k: /delete

echo Удаление диска "X"
@net use x: /delete

echo Удаление диска "P"
@net use p: /delete

echo Удаление диска "R"
@net use r: /delete

echo Удаление диска "Y"
@net use y: /delete

:: Подключение новых сетевых дисков
echo Добавление сетевых дисков

echo Добавление диска "Х" для доступа к программе "Консультант +"
@net use x: \\cons\consplus

echo Добавление диска "P" для доступа к необходимой общей информации
@net use p: \\law\base

echo Добавление диска "Y" для доступа к локальной почте
@net use y: \\fsrv\mail

echo Все диски добавлены

:: Настройка часового пояса и схем питания
echo Настройка часового пояса и схем питания, добавление значков на рабочий стол

:: Установка часового пояса "North Asia Standard Time"
tzutil /s "North Asia Standard Time"

:: Применение схемы энергопитания "Высокая производительность"
powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Отключение таймаута для отключения дисков в схемах питания
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0

:: Дополнительные настройки для питания
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

:: Перемещение в системную директорию Windows
cd %systemroot%\system32

:: Добавление значков на рабочий стол (отображение значков "Мой компьютер" и "Сеть")
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f

:: Скрытие кнопки Cortana и изменение параметров поиска на панели задач
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f

:: Отключение новостей и интересов на панели задач
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f

:: Настройка KMS сервера для активации Windows
echo Настройка KMS сервера
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms bu.adm.local:1688
slmgr /ato

:: Настройка брандмауэра (включение обнаружения сети и общего доступа к файлам/принтерам)
echo Настройка брандмауэра
netsh advfirewall firewall set rule group="Обнаружение сети" new enable=Yes
netsh advfirewall firewall set rule group="Общий доступ к файлам и принтерам" new enable=Yes
pause

:: Установка приложений и утилит
echo Установка приложений

echo Установка драйверов Рутокен
start /wait "" "\\law\base\Distrib\ЭЦП\Настройка рабочего места\rtDrivers.exe"
echo Готово

echo Установка плагина Крипто-ПРО
start /wait "" "\\law\base\Distrib\ЭЦП\Настройка рабочего места\cadesplugin.exe"
echo Готово

echo Плагин для Гос.услуги
start /wait "" "\\law\base\Distrib\ЭЦП\Настройка рабочего места\IFCPlugin-x64.msi"
echo Готово

echo Установка 7-zip
start /wait "" "\\law\base\Distrib\7zip 19.00\7z1900-x64.exe" /S
echo Готово

echo Установка Яндекс Браузер
start /wait "" "\\law\base\Distrib\ЭЦП\Настройка рабочего места\Yandex.exe"
echo Готово

echo Установка K-Lite Codek Pack
start /wait "" "\\law\base\Distrib\K-Lite Codek Pack 15.6.0\K-Lite_Codec_Pack_1560_Full.exe" /verysilent
echo Готово

echo Установка Google Chrome
start /wait "" "\\law\base\Distrib\ChromeStandaloneSetup64.exe"
echo Готово

echo Установка Консультант плюс
start /wait "" "\\cons\ConsPlus\CONS.EXE"
pause
echo Готово

:: Копирование иконки для запуска "Консультант плюс Регион" на рабочий стол
echo Установка Консультант плюс Регион
copy "\\law\base\ConsultantPlus Region.lnk" "%USERPROFILE%\Desktop\"
pause
echo Готово

:: Копирование программы для просмотра PDF на диск C
echo Копирование PDF-XChangeViewer на диск C
robocopy "\\law\base\Distrib\PDF-XChangeViewer" C:\PDF-XChangeViewer /E /NFL /NDL /NJH /NJS /nc /ns /np
echo Готово

:: Копирование иконки для запуска программы "Гарант Проксима" на рабочий стол
echo Установка Гарант Проксима
copy "\\law\base\Гарант Проксима.url" "%USERPROFILE%\Desktop\"
echo Готово

:: Установка MS Office 2019
echo Установка MS Office 2019
cd /d "P:\Distrib\MS Office 2019 Standart"
start Start.bat
pause
echo Готово

:: Установка антивируса Kaspersky Endpoint Security
echo Установка Kaspersky Endpoint Security
start "" "\\avp\KSCShare\PkgInst\NetAgent_14.0.0.10902_KES_11.8.0.384(1)\installer.exe"
pause
echo Готово

:: Установка Directum (спрашиваем пользователя)
echo Вы хотите установить программу "Directum"? (y/n)
choice /c yn /n /m "Выберите y или n:"

if errorlevel 2 goto NoDirectum
if errorlevel 1 goto YesDirectum

:YesDirectum
echo Вы выбрали установку программы Directum.
start "" "\\edo\ClientLite\5.8.5\Client.exe"
goto DirectumEnd

:NoDirectum
echo Вы выбрали отказ от установки программы Directum.

:DirectumEnd
echo Продолжаем выполнение сценария...
pause

:: Установка надстройки для Directum (спрашиваем пользователя)
echo Вы хотите установить надстройку для Directum? (y/n)
choice /c yn /n /m "Выберите y или n:"

if errorlevel 2 goto NoDirectumAddOn
if errorlevel 1 goto YesDirectumAddOn

:YesDirectumAddOn
echo Вы выбрали установку надстройки для Directum.
msiexec /i "\\edo\ClientLite\5.8.5\OfficeIntegration.msi"
goto End

:NoDirectumAddOn
echo Вы выбрали отказ от установки надстройки для Directum.

:End
echo Продолжаем выполнение сценария...
pause

:: Установка программы "Крипто-Про 4.0" (спрашиваем пользователя)
echo Вы хотите установить программу "Крипто-Про 4.0"? (y/n)
choice /c yn /n /m "Выберите y или n:"

if errorlevel 2 goto NoCryptoPro
if errorlevel 1 goto YesCryptoPro

:YesCryptoPro
echo Вы выбрали установку программы Crypto-Pro.
start "" "\\law\base\Distrib\ЭЦП\Настройка рабочего места\CryptoPRO 4.09963\CSPSetup.exe"
goto End

:NoCryptoPro
echo Вы выбрали отказ от установки программы Crypto-Pro.

:End
pause
