@echo off
REM 在 cmd 中使用本项目的 JDK 17，不影响系统默认的 JDK 8。
REM 用法（必须用 call，否则环境变量不会保留在当前窗口）：
REM     call scripts\jdk17.bat
set "JAVA_HOME=C:\Users\liaoyq\.jdks\ms-17.0.19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
echo [jdk17] JAVA_HOME=%JAVA_HOME%
java -version
