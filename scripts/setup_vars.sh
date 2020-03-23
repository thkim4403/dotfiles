if [ -z "$(cat /proc/version | grep Microsoft)" ]; then
    export IS_WSL=true
fi
