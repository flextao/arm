@echo off
rem ---------------------------------------------------------------------------
rem jrake.bat - Start JRake -- build super star java version :-)
rem
rem for info on environment variables, see internal batch script _jrubyvars.bat

call "%~dp0_jrubyvars.bat" %*

"%_STARTJAVA%" %_VM_OPTS% -cp "%CLASSPATH%" -Djruby.shell="cmd.exe" org.jruby.Main %JRUBY_OPTS% -S rake %*
set E=%ERRORLEVEL%

call "%~dp0_jrubycleanup.bat"