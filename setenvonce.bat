@REM @echo off

@call config.cmd

@echo  *** Instalando el .Net Framework 4.5.2 en modo online (IMPORTANTE: SI no tiene conexion a internet, vea "MANUAL.txt"
@NDP452-KB2901954-Web.exe /q /norestart /ChainingPackage ADMINDEPLOYMENT

@echo  *** Habilitando ASP.Net 4.5 para el IIS
@REM 1) Habilitar en caso de que no este el ASP.Net 4.5 para el IIS Application pools. Sino da error:
						REM HTTP Error 404.3 - Not Found
						REM The page you are requesting cannot be served because of the extension configuration. If the page is a script, add a handler. If the file should be downloaded, add a MIME map.

@REM dism /online  /enable-feature /all /featurename:IIS-ASPNET45
dism /enable-feature /all /online /featureName:IIS-WebServerRole /featureName:IIS-WebServer /featureName:IIS-CommonHttpFeatures /featureName:IIS-StaticContent /featureName:IIS-DefaultDocument /featureName:IIS-DirectoryBrowsing /featureName:IIS-HttpErrors /featureName:IIS-HttpRedirect /featureName:IIS-ApplicationDevelopment /featureName:IIS-ASPNET /featureName:IIS-NetFxExtensibility /featureName:IIS-ASPNET45


@REM 2) Copiar La WebApp (publicada previamente) al %SITEPATH%
@echo  *** Creando directorio de la webapp
mkdir %SITEPATH% 2> nul

@echo  *** Creando AppPool y WebSite
%APPCMDPATH%\appcmd add apppool /name:"%SITEPOOL%"
%APPCMDPATH%\appcmd add site /name:"%SITENAME%" /physicalPath:"%SITEPATH%" /bindings:http/*:%SITEPORT%:
%APPCMDPATH%\appcmd set site /site.name:"%SITENAME%" /[path='/'].applicationPool:"%SITEPOOL%"

