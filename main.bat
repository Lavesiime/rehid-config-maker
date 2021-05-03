@echo off
::Move to this program's directory
cd "%~dp0"
::The starting parts
echo {> rehid.json
echo "remappings":[>> rehid.json

goto mainLoop
:isValidKey1
::pain
if %ans1%==a set ans1=A
if %ans1%==b set ans1=B
if %ans1%==x set ans1=X
if %ans1%==y set ans1=Y
if %ans1%==l set ans1=L
if %ans1%==r set ans1=R
if %ans1%==zl set ans1=ZL
if %ans1%==zr set ans1=ZR
if %ans1%==up set ans1=UP
if %ans1%==down set ans1=DOWN
if %ans1%==left set ans1=LEFT
if %ans1%==right set ans1=RIGHT
if %ans1%==start set ans1=START
if %ans1%==select set ans1=SELECT

set lo=0
if %ans1%==A set lo=1
if %ans1%==B set lo=1
if %ans1%==X set lo=1
if %ans1%==Y set lo=1
if %ans1%==L set lo=1
if %ans1%==R set lo=1
if %ans1%==ZL set lo=1
if %ans1%==ZR set lo=1
if %ans1%==UP set lo=1
if %ans1%==DOWN set lo=1
if %ans1%==LEFT set lo=1
if %ans1%==RIGHT set lo=1
if %ans1%==START set lo=1
if %ans1%==SELECT set lo=1
if %lo%==0 goto fail
goto isValidKey2

:isValidKey2
if %ans2%==a set ans2=A
if %ans2%==b set ans2=B
if %ans2%==x set ans2=X
if %ans2%==y set ans2=Y
if %ans2%==l set ans2=L
if %ans2%==r set ans2=R
if %ans2%==zl set ans2=ZL
if %ans2%==zr set ans2=ZR
if %ans2%==up set ans2=UP
if %ans2%==down set ans2=DOWN
if %ans2%==left set ans2=LEFT
if %ans2%==right set ans2=RIGHT
if %ans2%==start set ans2=START
if %ans2%==select set ans2=SELECT

set lo=0
if %ans2%==A set lo=1
if %ans2%==B set lo=1
if %ans2%==X set lo=1
if %ans2%==Y set lo=1
if %ans2%==L set lo=1
if %ans2%==R set lo=1
if %ans2%==ZL set lo=1
if %ans2%==ZR set lo=1
if %ans2%==UP set lo=1
if %ans2%==DOWN set lo=1
if %ans2%==LEFT set lo=1
if %ans2%==RIGHT set lo=1
if %ans2%==START set lo=1
if %ans2%==SELECT set lo=1
if %lo%==0 goto fail
goto saveToJson

:fail
::Bad key, restart this entry
echo Bad key detected, please try again
pause
cls
goto mainLoop

:saveToJson
::Whether or not to add a comma at the end of the entry
choice /m "Do you want to make another replacement?"
if %ERRORLEVEL%==1 goto more

::User chose to end the file, add the end braces and no comma
echo {"get":"%ans2%", "press":"%ans1%"}>>rehid.json
echo ]>> rehid.json
echo }>> rehid.json
goto end

:more
echo {"get":"%ans2%", "press":"%ans1%"},>>rehid.json
goto mainLoop

:mainLoop
cls
::Take the keys
set /p ans1=What key do you want to replace? 
set /p ans2=What key do you want to replace it with? 
::Move to the key checking process
goto isValidKey1

:end
cls
echo File generated, move the generated rehid.json to your SD card's rehid folder
echo You can find the generated rehid.json at %CD%\rehid.json
pause