# demo_devops

## Instrucciones de Uso

###########
####(1) Configuracion
Configurar del config.cmd las variables definidas en la seccion: "VARIABLES A CONFIGURAR". Concretamente:

- MSBUILD: path donde esta el compilador de visual studio (el entorno en que se probo fue con VS2013 community edition)
- SITEPATH: directorio donde se encontrara la webapp publicada
- SITENAME: nombre del sitio (http://localhost/<SITENAME>)
- SITEPOOL: nombre del apppool del sitio 
- SITEPORT: Puerto en el que se accedera al sitio
- APPCMDPATH: directorio donde se encuentra los comandos del iis (recomendado dejar el directorio por defecto)

###########
####(2) Preparación de entorno  (unica vez)
Abrir un cmd con permisos de administrador, ubicarse en el directorio raiz donde se encuentra el bat setenvonce.bat y ejecutarlo

NOTA: El framework 4.5.2 utilizado, se lo instala de manera online a traves de su webinstaller (que se adjunta en el procedimiento). Si no tiene salida a internet.
Instalarlo de manera offline bajo sus propios medios y agregar a las lineas del setenvonce.bat:

@echo  *** Instalando el .Net Framework 4.5.2 en modo online 
@NDP452-KB2901954-Web.exe /q /norestart /ChainingPackage ADMINDEPLOYMENT

la palabra "REM" (sin comillas), quedando:

REM @echo  *** Instalando el .Net Framework 4.5.2 en modo online
REM @NDP452-KB2901954-Web.exe /q /norestart /ChainingPackage ADMINDEPLOYMENT

###########
####(3) Building
Abrir un cmd con permisos de administrador, ubicarse en el directorio raiz donde se encuentra el bat build.bat y ejecutarlo

NOTA: Para realizar la compilación, es necesario tener instalado los compiladores propios del Visual Studio (MSBUILD) y configurar la variable correspondiente mencionada en el paso (1)


###########
####(4) Deployment
Abrir un cmd con permisos de administrador, ubicarse en el directorio raiz donde se encuentra el bat deployapp.bat y ejecutarlo