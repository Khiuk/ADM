echo ����஢���� ��᪮�

@rem ��ਯ� ��⮬���᪮�� ���������� �⥢�� ��᪮� ����� ���� �������� � �ਯ⠬ ���ਧ�樨 �� ����஫��� ������
@rem �������� �⥢�� ��᪮� ����� ����� ���� �ᯮ�짮����, ��� ���࠭���� ��������� ���䫨�⮢

@echo �������� ��᪠ "K"
@net use k: /delete

@echo �������� ��᪠ "X"
@net use x: /delete

@echo �������� ��᪠ "P"
@net use p: /delete

@echo �������� ��᪠ "R"
@net use r: /delete

@echo �������� ��᪠ "Y"
@net use y: /delete

@echo ���������� �⥢�� ��᪮�


@echo ���������� ��᪠ "�" ��� ����㯠 � �ணࠬ�� "������⠭� +"
@net use x: \\cons\consplus

@echo ���������� ��᪠ "P" ��� ����㯠 � ����室���� ��饩 ���ଠ樨
@net use p: \\law\base


@echo ���������� ��᪠ "Y" ��� ����㯠 � �����쭮� ����
@net use y: \\fsrv\mail
@echo �� ��᪨ ���������
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
netsh advfirewall firewall set rule group="�����㦥��� ��" new enable=Yes
netsh advfirewall firewall set rule group="��騩 ����� � 䠩��� � �ਭ�ࠬ" new enable=Yes
pause
echo Install Apps
echo Install rtDrivers
cd /d "P:\Distrib\���\����ன�� ࠡ�祣� ����\"
start /wait rtDrivers.exe
echo Done
cd ..
echo CryptoPro-plugin
cd /d "P:\Distrib\���\����ன�� ࠡ�祣� ����\"
start /wait cadesplugin.exe
echo Done
cd ..
echo Gosuslugi-plugin
cd /d "P:\Distrib\���\����ன�� ࠡ�祣� ����\"
start /wait IFCPlugin-x64.msi
echo Done
cd ..
echo Install 7-zip
cd /d "P:\Distrib\7zip 19.00"
start /wait 7z1900-x64 /S
echo Done
cd ..
echo Install Yandex.Browser
cd /d "P:\Distrib\���\����ன�� ࠡ�祣� ����\"
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
echo �������� ��몠...
copy "%TargetFile%" "%DesktopFolder%\%ShortcutName%.lnk" > nul
echo ��� �ᯥ譮 ᮧ��� � ᪮��஢�� �� ࠡ�稩 �⮫.
pause
cd ..
echo Done
echo install garant
copy "P:\��࠭� �பᨬ�.url" "%USERPROFILE%\Desktop\"
echo Done
echo Install MS Office 2019
cd /d "P:\Distrib\MS Office 2019 Standart"
start Start.bat
pause
:: ����塞 ��� ����� �� ������ �����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d 0200000000000000 /f

:: ����塞 ��� Microsoft Store �� ������ �����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /t REG_BINARY /d 0200000000000000 /f

:: ����塞 ��� Edge �� ������ �����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d 0800000000000000 /f

@echo off

set "DesktopPath=%USERPROFILE%\Desktop"

:: �������� ��몠 "Google Chrome"
if exist "%DesktopPath%\Google Chrome.lnk" (
    del "%DesktopPath%\Google Chrome.lnk"
    echo ��� "Google Chrome" 㤠���.
) else (
    echo ��� "Google Chrome" �� ������ �� ࠡ�祬 �⮫�.
)

:: �������� ��몠 "Microsoft Edge"
if exist "%DesktopPath%\Microsoft Edge.lnk" (
    del "%DesktopPath%\Microsoft Edge.lnk"
    echo ��� "Microsoft Edge" 㤠���.
) else (
    echo ��� "Microsoft Edge" �� ������ �� ࠡ�祬 �⮫�.
)

:: �������� ��몠 "Yandex"
if exist "%DesktopPath%\Yandex.lnk" (
    del "%DesktopPath%\Yandex.lnk"
    echo ��� "Yandex" 㤠���.
) else (
    echo ��� "Yandex" �� ������ �� ࠡ�祬 �⮫�.
)

exit

:: ��१���᪠�� ������� Explorer.exe ��� �ਬ������ ���������
taskkill /f /im explorer.exe
start explorer.exe