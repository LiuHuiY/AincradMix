@echo off
echo ���ڼ���Ѱ�װ��Ƥ������...
echo.
set "file=information.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo �Ѱ�װ��Ƥ����R_Sp[osu!] (%PackName%)
echo Ƥ�����ԣ�%PackLanguage%
echo �汾��%Version%
echo ����״̬��%Status%
echo.
echo ----------------------------------------
echo.
echo ���ڼ���Ѱ�װ��Ƥ����Ч...
echo.
set "file=sfx.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo ��Ч���⣺%SFXStyle%
echo.
echo ----------------------------------------
echo.
echo ���ڼ���Ѱ�װ��Ƥ������...
echo.
set "file=animation.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo ����֡�ʣ�%AnimantionFrame% Fps
echo �������ԣ�%AnimantionLanguage%
echo.
echo ----------------------------------------
echo.
echo ���ڼ���Ѱ�װ��Ƥ�����...
echo.
set "file=cursor.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo ������ͣ�%CursorStyle%
echo �����ɫ��%CursorColor%
echo.
echo.
echo.
pause