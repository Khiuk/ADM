@echo off
echo ����஢���� ��᪮�

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

echo ���������� �⥢�� ��᪮�


echo ���������� ��᪠ "�" ��� ����㯠 � �ணࠬ�� "������⠭� +"
@net use x: \\cons\consplus

echo ���������� ��᪠ "P" ��� ����㯠 � ����室���� ��饩 ���ଠ樨
@net use p: \\law\base

echo ���������� ��᪠ "Y" ��� ����㯠 � �����쭮� ����
@net use y: \\fsrv\mail

echo �� ��᪨ ���������

echo ����ன�� �ᮢ��� ���� � �奬 ��⠭��, ���������� ���窮� �� ࠡ�稩 �⮫

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

echo ����ன�� KMS �ࢥ�

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms bu.adm.local:1688
slmgr /ato

echo ����ன�� �࠭������

netsh advfirewall firewall set rule group="�����㦥��� ��" new enable=Yes
netsh advfirewall firewall set rule group="��騩 ����� � 䠩��� � �ਭ�ࠬ" new enable=Yes
pause

echo ��⠭���� �ਫ������

echo ��⠭���� �ࠩ��஢ ��⮪��
start /wait "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\rtDrivers.exe"
echo ��⮢�

echo ��⠭���� ������� �ਯ�-���
start /wait "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\cadesplugin.exe"
echo ��⮢�

echo ������ ��� ���.��㣨
start /wait "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\IFCPlugin-x64.msi"
echo ��⮢�

echo ��⠭���� 7-zip
start /wait "P:\Distrib\7zip 19.00\7z1900-x64 /S"
echo ��⮢�

echo ��⠭���� ������ ��㧥�
start /wait "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\Yandex.exe"
echo ��⮢�

echo ��⠭���� K-Lite Codek Pack
start /wait "\\law\base\Distrib\K-Lite Codek Pack 15.6.0\K-Lite_Codec_Pack_1560_Full.exe /verysilent" 
echo ��⮢�

echo ��⠭���� Google Chrome
start /wait "\\law\Distrib\ChromeStandaloneSetup64.exe"
echo ��⮢�

echo ��⠭���� ������⠭� ����
start /wait "\\cons\ConsPlus\CONS.EXE"
pause
echo ��⮢�

echo ��⠭���� ������⠭� ���� ������
copy "\\law\base\ConsultantPlus Region.lnk" "%USERPROFILE%\Desktop\"
pause
echo ��⮢�

echo ����஢���� PDF-XChangeViewer �� ��� C
robocopy "\\law\base\Distrib\PDF-XChangeViewer" C:\PDF-XChangeViewer /E /NFL /NDL /NJH /NJS /nc /ns /np
echo ��⮢�

echo ��⠭���� ��࠭� �பᨬ�
copy "\\law\base\��࠭� �பᨬ�.url" "%USERPROFILE%\Desktop\"
echo ��⮢�

echo ��⠭���� MS Office 2019
start "\\law\base\Distrib\MS Office 2019 Standart\Start.bat"
pause
echo ��⮢�

echo ��⠭���� Kaspersky Endpoint Security
start "\\avp\KSCShare\PkgInst\NetAgent_14.0.0.10902_KES_11.8.0.384(1)\installer.exe"
pause
echo ��⮢�

echo �� ��� ��⠭����� �ணࠬ�� "Directum"? (y/n)
choice /c yn /n /m "�롥�� y ��� n:"

if errorlevel 2 goto No
if errorlevel 1 goto Yes

:Yes
echo �� ��ࠫ� ��⠭���� �ணࠬ��.
start "\\edo\ClientLite\5.8.5\Client.exe"
goto End

:No
echo �� ��ࠫ� �⪠� �� ��⠭���� �ணࠬ��.
goto End

echo �� ��� ��⠭����� �ணࠬ�� "�ਯ�-�� 4.0"? (y/n)
choice /c yn /n /m "�롥�� y ��� n:"

if errorlevel 2 goto No
if errorlevel 1 goto Yes

:Yes
echo �� ��ࠫ� ��⠭���� �ணࠬ��.
start "\\law\base\Distrib\���\����ன�� ࠡ�祣� ����\CryptoPRO 4.09963\CSPSetup.exe"
goto End

:No
echo �� ��ࠫ� �⪠� �� ��⠭���� �ணࠬ��.
goto End
