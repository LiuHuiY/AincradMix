@echo off
mode 120,35
set workdir=%~dp0

:installedcheck
title R_Sp[osu!] - ��װ���
color 0F

:information
cls
mode 120,13
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               �Ѱ�װ��Ƥ��               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist information.rsp ( set "file=%workdir%information.rsp" ) else ( goto error1 )
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
choice /c nb /m "��һ��(n) ���ز���(b)"
if errorlevel 2 goto test
if errorlevel 1 goto sfx
pause

:sfx
cls
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               �Ѱ�װ����Ч               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist sfx.rsp ( set "file=%workdir%sfx.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ��Ч���⣺%SFXStyle%
echo.
echo.
choice /c pnb /m "��һ��(p) ��һ��(n) ���ز���(b)"
if errorlevel 3 goto test
if errorlevel 2 goto animation
if errorlevel 1 goto information
pause

:animation
cls
mode 120,10
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               �Ѱ�װ�Ķ���               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist animation.rsp ( set "file=%workdir%animation.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ����֡�ʣ�%AnimantionFrame% Fps
echo �������ԣ�%AnimantionLanguage%
echo.
echo.
choice /c pnb /m "��һ��(p) ��һ��(n) ���ز���(b)"
if errorlevel 3 goto test
if errorlevel 2 goto cursor
if errorlevel 1 goto sfx
pause

:cursor
cls
mode 120,10
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               �Ѱ�װ�Ĺ��               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist cursor.rsp ( set "file=%workdir%cursor.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo ������ͣ�%CursorStyle%
echo �����ɫ��%CursorColor%
echo.
echo.
choice /c pnb /m "��һ��(p) ����(n) ���ز���(b)"
if errorlevel 3 goto test
if errorlevel 2 goto workdir
if errorlevel 1 goto animation
pause

:workdir
mode 120,13
title R_Sp[osu!] - ����Ŀ¼
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                      /               ��ǰ�Ĺ���Ŀ¼               /                                     
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo ��������һ�в�������������ļ����ڽ��У���ȷ��
echo %workdir%
echo.
echo.
pause & goto installation

:installation
mode 120,9
title R_Sp[osu!] - ���ڳ�ʼ��
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               �Ƿ�ɾ���Ѱ�װ��Ƥ�����Ƽ�ɾ����ע�ⱸ�ݣ�               /                       
echo.
echo                                                   ��(Y)    --    ��(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto basiclanguageselection
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               �Ƿ�ɾ���Ѱ�װ��Ƥ�����Ƽ�ɾ����ע�ⱸ�ݣ�               /                       
echo.
echo                                                         ����ɾ��                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
cd %workdir% & erase %workdir%*.png + *.jpg + *.rsp + *.ini + *.wav + *.mp3 + sed*
) & goto createrspfiles

:createrspfiles
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               ���ڳ�ʼ��               /                                       
echo.
echo                                                       ���������ļ�                                                      
echo.
echo ------------------------------------------------------------------------------------------------------------------------
(
echo PackName: base
echo PackLanguage: unknown
echo Version: 20190111
echo Status: testing
) >> information.rsp
(
echo AnimantionLanguage: unknown
echo AnimantionFrame: 0
) >> animation.rsp
(
echo SFXStyle: unknown
echo SFX: unknown
) >> sfx.rsp
(
echo CursorStyle: unknown
echo CursorColor: unknown
) >> cursor.rsp
pause & goto basiclanguageselection

:basiclanguageselection
mode 120,10
title R_Sp[osu!] - ��������ѡ��
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               ��ѡ���������               /                                     
echo.
echo                                         (c) - ����                    Ӣ�� - (e)                                        
echo.
choice /c cejr /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 mode 120,2 & echo ���ڸ����ļ� & xcopy /y /q %workdir%Pack_[base]\Pack_[base_en]\* %workdir%
if errorlevel 1 mode 120,2 & echo ���ڸ����ļ� & xcopy /y /q %workdir%Pack_[base]\Pack_[base_cn]\* %workdir%
echo.
echo.
goto animationframeselection

:animationframeselection
mode 120,10
title R_Sp[osu!] - ����֡��ѡ��
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               ��ѡ��֡��               /                                       
echo.
echo                                         (1) - 1 FPS                 15 FPS - (2)                                        
echo                                         (3) - 30 FPS                60 FPS - (4)                                        
echo.
choice /c 1234 /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4	cd %workdir%Pack_[animation]\Frame_[60] && set framerate=60
if errorlevel 3	cd %workdir%Pack_[animation]\Frame_[30] && set framerate=30
if errorlevel 2 cd %workdir%Pack_[animation]\Frame_[15] && set framerate=15
if errorlevel 1 set framerate=1 && goto successfulinstallation
echo.
echo.
goto animationlanguageselection

:animationlanguageselection
mode 120,10
title R_Sp[osu!] - ��������ѡ��
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               ��ѡ�񶯻�����               /                                     
echo.
echo                                         (c) - ����                    Ӣ�� - (e)                                        
echo.
choice /c ce /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 cd Pack_[animation_*_en] & mode 120,2 & echo ���ڸ����ļ� & xcopy /y /q .\* %workdir%
if errorlevel 1 cd Pack_[animation_*_cn] & mode 120,2 & echo ���ڸ����ļ� & xcopy /y /q .\* %workdir%
echo.
echo.
pause & goto successfulinstallation

:successfulinstallation
mode 120,10
title R_Sp[osu!] - ��װ���
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                /               ���Ѿ��ɹ���װ��R_Sp[osu!]               /                               
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
pause

:settoyourself
mode 120,10
title R_Sp[osu!] - ��װ���
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               ���Ѿ��ɹ���װ��R_Sp[osu!]               /                               
echo.
echo                                          �Ƿ� R_Sp[osu!] ����Ϊ���osu!Ƥ��                                           
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto skinconfiguration
if errorlevel 1 cd %workdir% && cd .. && cd .. && ( %workdir%sed -i "112c Skin = R_Sp[osu!]" osu!.*.cfg ) && (
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               ���Ѿ��ɹ���װ��R_Sp[osu!]               /                               
echo.
echo                                                        �������                                                         
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo. )
pause & exit

:choice1
mode 120,10
title R_Sp[osu!] - ѡ�����
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                    /               �Ƿ���е�ģʽ�Ż�               /                                   
echo.
echo                                                   ��(Y)    --    ��(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 echo yes
if errorlevel 1 echo no
echo.
echo.
pause

:error1
mode 120,12
title R_Sp[osu!] - ����
color 0C
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                       /               �����ļ�ȱʧ               /                                      
echo.
echo                                                  �����ļ�Ŀ¼�Ƿ�����                                                 
echo. 
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
pause & exit

:exit
mode 120,10
title R_Sp[osu!] - �˳�
color 0C
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                         /               �����Ự               /                                        
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
pause & exit

:skinconfiguration
echo [General]
echo Name: R_Sp[osu!]
echo Author: Sendevia
echo Version: latest
echo AnimationFramerate: %framerate%
echo AllowSliderBallTint: 0
echo ComboBurstRandom: 0
echo CursorExpand: 1
echo CursorCentre: 1
echo CursorRotate: 0
echo CursorTrailRotate: 0
echo CustomComboBurstSounds: 100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000
echo HitCircleOverlayAboveNumber: 0
echo LayeredHitSounds: 1
echo SliderBallFlip: 1
echo SliderBallFrames: %framerate%
echo SliderStyle: 2
echo SpinnerFadePlayfield: 0
echo SpinnerFrequencyModulate: 1
echo SpinnerNoBlink: 1
echo.
echo [Colours]
echo Combo1: 5,150,192
echo InputOverlayText: 238,238,238
echo MenuGlow: 89,195,226
echo SliderBall: 238,238,238
echo SliderBorder: 3,80,102
echo SliderTrackOverride: 0,0,0
echo SongSelectActiveText: 238,238,238
echo SongSelectInactiveText: 238,238,238
echo SpinnerBackground: 113,113,113
echo StarBreakAdditive: 19,19,19
echo.
echo [Fonts]
echo HitCirclePrefix: circlenums
echo HitCircleOverlap: 0
echo ScorePrefix: defaultItalic
echo ScoreOverlap: 2
echo ComboPrefix: combo
echo ComboOverlap: 2
echo.
echo [CatchTheBeat]
echo HyperDashFruit: 255,198,0
echo.
pause