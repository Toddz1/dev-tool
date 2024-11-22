#!/bin/bash

# 获取当前 shell 的绝对路径
DEV_TOOLS_get_current_shell() {
    if [ -n "$SHELL" ]; then
        echo "$SHELL"
    else
        echo "Error: \$SHELL environment variable is not set." >&2
        return 1
    fi
}

# 获取 shell 路径
DEV_TOOLS_SHELL_PATH=$(DEV_TOOLS_get_current_shell) || {
    echo "Failed to determine shell path"
    exit 1
}

echo $DEV_TOOLS_SHELL_PATH
