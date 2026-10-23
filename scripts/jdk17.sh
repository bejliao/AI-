#!/usr/bin/env bash
# 在 Git Bash / WSL 中使用本项目的 JDK 17，不影响系统默认的 JDK 8。
# 用法（必须 source，否则只影响子进程）：
#     source scripts/jdk17.sh
export JAVA_HOME='C:\Users\liaoyq\.jdks\ms-17.0.19'
export PATH="/c/Users/liaoyq/.jdks/ms-17.0.19/bin:$PATH"
echo "[jdk17] JAVA_HOME=$JAVA_HOME"
java -version
