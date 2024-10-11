@echo off
:: �⪫�砥� �뢮� ������ ��� ���襭�� �⠥����

echo ����஢���� ��᪮�

:: �������� ࠭�� ������祭��� �⥢�� ��᪮�
echo �������� ��᪠ "K"
@net use k: /delete

echo �������� ��᪠ "X"
@net use x: /delete

echo �������� ��᪠ "P"
@net use p: /delete

echo �������� ��᪠ "R"
@net use r: /delete

echo �������� ��᪠ "Y"
@net use y: /delete

:: ������祭�� ����� �⥢�� ��᪮�
echo ���������� �⥢�� ��᪮�

echo ���������� ��᪠ "�" ��� ����㯠 � �ணࠬ�� "������⠭� +"
@net use x: \\cons\consplus

echo ���������� ��᪠ "P" ��� ����㯠 � ����室���� ��饩 ���ଠ樨
@net use p: \\law\base

echo ���������� ��᪠ "Y" ��� ����㯠 � �����쭮� ����
@net use y: \\fsrv\mail

echo �� ��᪨ ���������

:: ����ன�� �ᮢ��� ���� � �奬 ��⠭��
echo ����ன�� �ᮢ��� ���� � �奬 ��⠭��, ���������� ���窮� �� ࠡ�稩 �⮫

:: ��⠭���� �ᮢ��� ���� "North Asia Standard Time"
tzutil /s "North Asia Standard Time"

:: �ਬ������ �奬� �࣮��⠭�� "��᮪�� �ந�����⥫쭮���"
powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: �⪫�祭�� ⠩���� ��� �⪫�祭�� ��᪮� � �奬�� ��⠭��
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0

:: �������⥫�� ����ன�� ��� ��⠭��
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

:: ��६�饭�� � ��⥬��� ��४��� Windows
cd %systemroot%\system32

:: ���������� ���窮� �� ࠡ�稩 �⮫ (�⮡ࠦ���� ���窮� "��� ��������" � "����")
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f

:: ����⨥ ������ Cortana � ��������� ��ࠬ��஢ ���᪠ �� ������ �����
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f

:: �⪫�祭�� �����⥩ � ����ᮢ �� ������ �����
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f

:: ����ன�� KMS �ࢥ� ��� ��⨢�樨 Windows
echo ����ன�� KMS �ࢥ�
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms bu.adm.local:1688
slmgr /ato

:: ����ன�� �࠭������ (����祭�� �����㦥��� �� � ��饣� ����㯠 � 䠩���/�ਭ�ࠬ)
echo ����ன�� �࠭������
netsh advfirewall firewall set rule group="�����㦥��� ��" new enable=Yes
netsh advfirewall firewall set rule group="��騩 ����� � 䠩��� � �ਭ�ࠬ" new enable=Yes
pause

:: ��⠭���� �ਫ������ � �⨫��
echo ��⠭���� �ਫ������

echo ��⠭���� �ࠩ��஢ ��⮪��
start /wait "" "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\rtDrivers.exe"
echo ��⮢�

echo ��⠭���� ������� �ਯ�-���
start /wait "" "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\cadesplugin.exe"
echo ��⮢�

echo ������ ��� ���.��㣨
start /wait "" "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\IFCPlugin-x64.msi"
echo ��⮢�

echo ��⠭���� 7-zip
start /wait "" "\\law\base\Distrib\7zip 19.00\7z1900-x64.exe" /S
echo ��⮢�

echo ��⠭���� ������ ��㧥�
start /wait "" "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\Yandex.exe"
echo ��⮢�

echo ��⠭���� K-Lite Codek Pack
start /wait "" "\\law\base\Distrib\K-Lite Codek Pack 15.6.0\K-Lite_Codec_Pack_1560_Full.exe" /verysilent
echo ��⮢�

echo ��⠭���� Google Chrome
start /wait "" "\\law\base\Distrib\ChromeStandaloneSetup64.exe"
echo ��⮢�

echo ��⠭���� ������⠭� ����
start /wait "" "\\cons\ConsPlus\CONS.EXE"
pause
echo ��⮢�

:: ����஢���� ������ ��� ����᪠ "������⠭� ���� ������" �� ࠡ�稩 �⮫
echo ��⠭���� ������⠭� ���� ������
copy "\\law\base\ConsultantPlus Region.lnk" "%USERPROFILE%\Desktop\"
pause
echo ��⮢�

:: ����஢���� �ணࠬ�� ��� ��ᬮ�� PDF �� ��� C
echo ����஢���� PDF-XChangeViewer �� ��� C
robocopy "\\law\base\Distrib\PDF-XChangeViewer" C:\PDF-XChangeViewer /E /NFL /NDL /NJH /NJS /nc /ns /np
echo ��⮢�

:: ����஢���� ������ ��� ����᪠ �ணࠬ�� "��࠭� �பᨬ�" �� ࠡ�稩 �⮫
echo ��⠭���� ��࠭� �பᨬ�
copy "\\law\base\��࠭� �பᨬ�.url" "%USERPROFILE%\Desktop\"
echo ��⮢�

:: ��⠭���� MS Office 2019
echo ��⠭���� MS Office 2019
cd /d "P:\Distrib\MS Office 2019 Standart"
start Start.bat
pause
echo ��⮢�

:: ��⠭���� ��⨢���� Kaspersky Endpoint Security
echo ��⠭���� Kaspersky Endpoint Security
start "" "\\avp\KSCShare\PkgInst\NetAgent_14.0.0.10902_KES_11.8.0.384(1)\installer.exe"
pause
echo ��⮢�

:: ��⠭���� Directum (��訢��� ���짮��⥫�)
echo �� ��� ��⠭����� �ணࠬ�� "Directum"? (y/n)
choice /c yn /n /m "�롥�� y ��� n:"

if errorlevel 2 goto NoDirectum
if errorlevel 1 goto YesDirectum

:YesDirectum
echo �� ��ࠫ� ��⠭���� �ணࠬ�� Directum.
start "" "\\edo\ClientLite\5.8.5\Client.exe"
goto DirectumEnd

:NoDirectum
echo �� ��ࠫ� �⪠� �� ��⠭���� �ணࠬ�� Directum.

:DirectumEnd
echo �த������ �믮������ �業���...
pause

:: ��⠭���� �����ன�� ��� Directum (��訢��� ���짮��⥫�)
echo �� ��� ��⠭����� �����ன�� ��� Directum? (y/n)
choice /c yn /n /m "�롥�� y ��� n:"

if errorlevel 2 goto NoDirectumAddOn
if errorlevel 1 goto YesDirectumAddOn

:YesDirectumAddOn
echo �� ��ࠫ� ��⠭���� �����ன�� ��� Directum.
msiexec /i "\\edo\ClientLite\5.8.5\OfficeIntegration.msi"
goto End

:NoDirectumAddOn
echo �� ��ࠫ� �⪠� �� ��⠭���� �����ன�� ��� Directum.

:End
echo �த������ �믮������ �業���...
pause

:: ��⠭���� �ணࠬ�� "�ਯ�-�� 4.0" (��訢��� ���짮��⥫�)
echo �� ��� ��⠭����� �ணࠬ�� "�ਯ�-�� 4.0"? (y/n)
choice /c yn /n /m "�롥�� y ��� n:"

if errorlevel 2 goto NoCryptoPro
if errorlevel 1 goto YesCryptoPro

:YesCryptoPro
echo �� ��ࠫ� ��⠭���� �ணࠬ�� Crypto-Pro.
start "" "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\CryptoPRO 4.09963\CSPSetup.exe"
goto End

:NoCryptoPro
echo �� ��ࠫ� �⪠� �� ��⠭���� �ணࠬ�� Crypto-Pro.

:End
pause
