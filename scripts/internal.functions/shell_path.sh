# 先定义函数
function DEV_TOOLS_internal_functions_shell_path() {
    if [ -n "$SHELL" ]; then
        echo "$SHELL"
    else
        echo "Error: \$SHELL environment variable is not set." >&2
        return 1
    fi
}

# 再导出函数
export -f DEV_TOOLS_internal_functions_shell_path > /dev/null
