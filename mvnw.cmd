@echo off
setlocal

set BASE_DIR=%~dp0
set WRAPPER_JAR=%BASE_DIR%\.mvn\wrapper\maven-wrapper.jar
set WRAPPER_PROPERTIES=%BASE_DIR%\.mvn\wrapper\maven-wrapper.properties

if not exist "%WRAPPER_JAR%" (
  for /f "usebackq tokens=1,* delims==" %%A in (`findstr /b "wrapperUrl=" "%WRAPPER_PROPERTIES%"`) do set WRAPPER_URL=%%B
  if "%WRAPPER_URL%"=="" (
    echo wrapperUrl is not set in %WRAPPER_PROPERTIES%
    exit /b 1
  )
  echo Downloading Maven wrapper from %WRAPPER_URL%
  powershell -Command "(New-Object Net.WebClient).DownloadFile('%WRAPPER_URL%','%WRAPPER_JAR%')" || exit /b 1
)

if "%JAVA_HOME%"=="" (
  set JAVA_EXE=java
) else (
  set JAVA_EXE=%JAVA_HOME%\bin\java
)

"%JAVA_EXE%" -classpath "%WRAPPER_JAR%" -Dmaven.multiModuleProjectDirectory="%BASE_DIR%" org.apache.maven.wrapper.MavenWrapperMain %*
