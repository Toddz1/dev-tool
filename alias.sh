#!/bin/bash


# 获取脚本所在目录的绝对路径
DEV_TOOLS_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DEV_TOOLS_ROOT_PATH

source $DEV_TOOLS_ROOT_PATH/scripts/internal.functions/shell_path.sh

alias dev.shell=$(DEV_TOOLS_internal_functions_shell_path)
alias dev.urlencode="dev.shell $DEV_TOOLS_ROOT_PATH/scripts/urlencode/urlencode.sh"
alias dev.urldecode="dev.shell $DEV_TOOLS_ROOT_PATH/scripts/urldecode/urldecode.sh"
