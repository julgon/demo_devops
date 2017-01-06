REM @echo off

@call config.cmd

@set DISTPATH=%CD%\Dist
@set DISTPATH_TEMP=%DISTPATH%_temp

@echo.
@echo  *** Preparando el copiado de la webapp %SITENAME%
@REM (hago un copy a un temporal y luego un move en vez de un copy directo, ya que a nivel fs es mas rapido que cambie el puntero. Reduciendo el tiempo de downtime de la app)
xcopy "%DISTPATH%\*" "%DISTPATH_TEMP%\*" /Y /E

@echo.
@echo  *** Deteniendo webapp %SITENAME%
%APPCMDPATH%\appcmd stop site /site.name:"%SITENAME%"

@echo.
@echo  *** Ejecutando recycle de app pool 
%APPCMDPATH%\appcmd recycle apppool /apppool.name:"%SITEPOOL%"

@echo.
@echo  *** Dando tiempo para que el IIS libere los recursos y carpetas de la Webapp
@timeout 4 > nul

@echo.
@echo  *** Copiando WebApp del directorio %DISTPATH% a %SITEPATH%
@set DUMPSITEPATH=%TEMP%\%SITENAME%_old

move "%SITEPATH%" "%DUMPSITEPATH%" 

move "%DISTPATH_TEMP%" "%SITEPATH%"
rmdir /s /q "%DISTPATH_TEMP%" 2>nul
icacls "%SITEPATH%" /grant iis_iusrs:(OI)(CI)F /T 

@echo.
@echo  *** Iniciando webapp %SITENAME%
%APPCMDPATH%\appcmd start site /site.name:"%SITENAME%"

@echo.
@echo  *** Finalizando tareas de limpieza...
rmdir /s /q "%DUMPSITEPATH%" 2>nul

@echo.
@echo *** Deployment de la WebApp demo_devops Finalizada ***
@start "C:\Program Files\Internet Explorer\iexplore.exe" http://localhost:%SITEPORT%

@echo.
@pause


