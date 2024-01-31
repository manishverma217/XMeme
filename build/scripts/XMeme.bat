@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  XMeme startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and X_MEME_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\xmeme.jar;%APP_HOME%\lib\spring-boot-starter-amqp-2.7.1.jar;%APP_HOME%\lib\spring-boot-starter-data-mongodb-2.7.1.jar;%APP_HOME%\lib\spring-boot-starter-data-redis-2.7.1.jar;%APP_HOME%\lib\spring-boot-starter-web-2.7.1.jar;%APP_HOME%\lib\mysql-connector-java-8.0.29.jar;%APP_HOME%\lib\spring-boot-starter-json-2.7.1.jar;%APP_HOME%\lib\spring-boot-starter-2.7.1.jar;%APP_HOME%\lib\spring-rabbit-2.4.6.jar;%APP_HOME%\lib\spring-messaging-5.3.21.jar;%APP_HOME%\lib\mongodb-driver-sync-4.6.1.jar;%APP_HOME%\lib\spring-data-mongodb-3.4.1.jar;%APP_HOME%\lib\spring-data-redis-2.7.1.jar;%APP_HOME%\lib\lettuce-core-6.1.8.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.7.1.jar;%APP_HOME%\lib\spring-webmvc-5.3.21.jar;%APP_HOME%\lib\spring-web-5.3.21.jar;%APP_HOME%\lib\protobuf-java-3.19.4.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.7.1.jar;%APP_HOME%\lib\spring-boot-2.7.1.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.7.1.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-data-keyvalue-2.7.1.jar;%APP_HOME%\lib\spring-context-support-5.3.21.jar;%APP_HOME%\lib\spring-context-5.3.21.jar;%APP_HOME%\lib\spring-tx-5.3.21.jar;%APP_HOME%\lib\spring-data-commons-2.7.1.jar;%APP_HOME%\lib\spring-oxm-5.3.21.jar;%APP_HOME%\lib\spring-aop-5.3.21.jar;%APP_HOME%\lib\spring-beans-5.3.21.jar;%APP_HOME%\lib\spring-amqp-2.4.6.jar;%APP_HOME%\lib\spring-expression-5.3.21.jar;%APP_HOME%\lib\spring-core-5.3.21.jar;%APP_HOME%\lib\snakeyaml-1.30.jar;%APP_HOME%\lib\amqp-client-5.13.1.jar;%APP_HOME%\lib\mongodb-driver-core-4.6.1.jar;%APP_HOME%\lib\bson-record-codec-4.6.1.jar;%APP_HOME%\lib\bson-4.6.1.jar;%APP_HOME%\lib\logback-classic-1.2.11.jar;%APP_HOME%\lib\log4j-to-slf4j-2.17.2.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.36.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\netty-handler-4.1.75.Final.jar;%APP_HOME%\lib\netty-codec-4.1.75.Final.jar;%APP_HOME%\lib\netty-transport-4.1.75.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.75.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.75.Final.jar;%APP_HOME%\lib\netty-common-4.1.75.Final.jar;%APP_HOME%\lib\reactor-core-3.3.22.RELEASE.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.13.3.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.13.3.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.13.3.jar;%APP_HOME%\lib\jackson-databind-2.13.3.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.64.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.64.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.64.jar;%APP_HOME%\lib\spring-jcl-5.3.21.jar;%APP_HOME%\lib\spring-retry-1.3.3.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\jackson-annotations-2.13.3.jar;%APP_HOME%\lib\jackson-core-2.13.3.jar;%APP_HOME%\lib\logback-core-1.2.11.jar;%APP_HOME%\lib\log4j-api-2.17.2.jar

@rem Execute XMeme
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %X_MEME_OPTS%  -classpath "%CLASSPATH%" com.backend.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable X_MEME_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%X_MEME_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
