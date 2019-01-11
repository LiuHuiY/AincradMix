@echo off
title R_Sp[osu!]��װ�ű� - ��װ���
color 0F
set workdir=%~dp0
:information
echo ----------------------------------------
echo           ���ڼ���Ѱ�װ��Ƥ��          
echo ----------------------------------------
echo.
if exist information.rsp ( set "file=information.rsp" ) else ( echo δ�ҵ������ļ� & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo �Ѱ�װ��R_Sp[osu!]
echo ���ͣ�%PackName%
echo Ƥ�����ԣ�%PackLanguage%
echo �汾��%Version%
echo ����״̬��%Status%
echo.
echo.

:sfx
echo ----------------------------------------
echo         ���ڼ���Ѱ�װ��Ƥ����Ч        
echo ----------------------------------------
echo.
if exist sfx.rsp ( set "file=sfx.rsp" ) else ( echo δ�ҵ������ļ� & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ��Ч���⣺%SFXStyle%
echo.
echo.

:animation
echo ----------------------------------------
echo         ���ڼ���Ѱ�װ��Ƥ������        
echo ----------------------------------------
echo.
if exist animation.rsp ( set "file=animation.rsp" ) else ( echo δ�ҵ������ļ� & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ����֡�ʣ�%AnimantionFrame% Fps
echo �������ԣ�%AnimantionLanguage%
echo.
echo.

:cursor
echo ----------------------------------------
echo         ���ڼ���Ѱ�װ��Ƥ�����        
echo ----------------------------------------
echo.
if exist cursor.rsp ( set "file=cursor.rsp" ) else ( echo δ�ҵ������ļ� & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ������ͣ�%CursorStyle%
echo �����ɫ��%CursorColor%
echo.
echo.
pause & goto choice

:choice
title R_Sp[osu!]��װ�ű� - ѡ�����
color 0E
cls
echo ----------------------------------------
echo.
echo.
echo               �Ƿ�������              
echo.
echo.
echo ----------------------------------------
choice /c yn
if errorlevel 2 goto exit
if errorlevel 1 goto test

:test
title R_Sp[osu!]��װ�ű� - ����
color 0F
cls
echo ----------------------------------------
echo.
echo.
echo ��ǰ�Ĺ���Ŀ¼��
echo %workdir%
echo.
echo.
echo ----------------------------------------
pause

:dirchoice
title R_Sp[osu!]��װ�ű� - Ŀ¼ѡ��
color 0E
cls
echo ----------------------------------------
echo.
echo.
echo Ŀ¼��
echo base(1) animation(2) cursors(3) sfx(4)
echo.
echo.
echo ���
echo ����(5) �˳�(6)
echo.
echo.
echo ----------------------------------------
choice /c 123456
if errorlevel 6 goto exit
if errorlevel 5 goto test
if errorlevel 4 cd Pack_[sfx] &cls & dir & cd %workdir% & color 0F
if errorlevel 3 cd Pack_[cursors] &cls & dir & cd %workdir% & color 0F
if errorlevel 2 cd Pack_[animation] &cls & dir & cd %workdir% & color 0F
if errorlevel 1 cd Pack_[base] &cls & dir & cd %workdir% & color 0F
echo.
echo.
pause & goto dirchoice

:checkerror
title R_Sp[osu!]��װ�ű� - ����
color 0C
cls
echo ----------------------------------------
echo.
echo.
echo               �����ļ�ȱʧ              
echo                    --                   
echo          �����ļ�Ŀ¼�Ƿ�����         
echo               errorcode: 1              
echo. 
echo.
echo ----------------------------------------
pause & exit

:exit
title R_Sp[osu!]��װ�ű� - �˳�
color 0C
cls
echo ----------------------------------------
echo.
echo.
echo                 �����Ự                
echo.
echo.
echo ----------------------------------------
pause & exit
