@echo off

@call config.cmd


set SOURCEPATH=%CD%\Source
set DISTPATH=%CD%\Dist
set PROJPATH=%SOURCEPATH%\demo_time\demo_time.csproj


REM set PREVPATH=%PATH%
REM set PATH=%MSBUILDPATH%;%PATH%


REM (Directorio definido en VS para dejar la webapp)
echo ** Eliminando directorio "%DISTPATH%"
rmdir /s /q "%DISTPATH%" 2>nul

echo ** Realizando compilacion y publicacion de webapp 
"%MSBUILDPATH%\msbuild" "%PROJPATH%" /p:DeployOnBuild=true /p:PublishProfile=publish

echo ** Compilacion finalizada

REM @set PATH=%PREVPATH%