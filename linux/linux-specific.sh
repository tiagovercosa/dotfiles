#!/bin/bash
# Linux-specific shell configurations

# fzf configuration (Arch Linux specific paths)
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
fi

# Linux-specific environment variables
export GTK_USE_PORTAL=1
export PLASMA_USE_QT_SCALING=1
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME="gtk3"

# Add Linux-specific paths
[[ -d /usr/local/bin ]] && export PATH="/usr/local/bin:$PATH"