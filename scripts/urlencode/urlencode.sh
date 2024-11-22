#!/bin/bash

# 脚本名: urlencode
# 功能: URL 编码输入的参数，支持管道输入和参数输入

# ANSI 颜色代码
DEV_TOOLS_RED='\033[0;31m'
DEV_TOOLS_NC='\033[0m' # No Color

# 检查 Python 是否安装
DEV_TOOLS_check_python() {
    if command -v python3 >/dev/null 2>&1; then
        DEV_TOOLS_PYTHON="python3"
    elif command -v python >/dev/null 2>&1; then
        # 检查 Python 版本
        DEV_TOOLS_VERSION=$(python -c 'import sys; print(sys.version_info[0])')
        if [ "$DEV_TOOLS_VERSION" -eq 3 ]; then
            DEV_TOOLS_PYTHON="python"
        else
            echo -e "${DEV_TOOLS_RED}Error: Python 3 is required but not installed.${DEV_TOOLS_NC}" >&2
            echo -e "${DEV_TOOLS_RED}Please install Python 3 to use this script.${DEV_TOOLS_NC}" >&2
            exit 1
        fi
    else
        echo -e "${DEV_TOOLS_RED}Error: Python 3 is required but not installed.${DEV_TOOLS_NC}" >&2
        echo -e "${DEV_TOOLS_RED}Please install Python 3 to use this script.${DEV_TOOLS_NC}" >&2
        exit 1
    fi
}

# 检查 Python 安装
DEV_TOOLS_check_python

# 处理输入
if [ -t 0 ]; then
    # 终端输入模式
    if [ $# -ne 1 ]; then
        echo "Usage: cmd_encode <string>" >&2
        echo "   or: echo <string> | cmd_encode" >&2
        echo "Example: cmd_encode 'hello world'" >&2
        echo "     or: echo 'hello world' | cmd_encode" >&2
        exit 1
    fi
    DEV_TOOLS_INPUT="$1"
else
    # 管道输入模式
    DEV_TOOLS_INPUT=$(cat)
fi

# 核心命令
echo -n "$DEV_TOOLS_INPUT" | $DEV_TOOLS_PYTHON -c "import sys, urllib.parse; print(urllib.parse.quote(sys.stdin.read()));"
