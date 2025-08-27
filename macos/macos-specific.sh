#!/bin/bash
# macOS-specific shell configurations

# Homebrew configuration
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# macOS-specific fzf configuration
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.bash ]]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.bash
    source /opt/homebrew/opt/fzf/shell/completion.bash
elif [[ -f /usr/local/opt/fzf/shell/key-bindings.bash ]]; then
    source /usr/local/opt/fzf/shell/key-bindings.bash
    source /usr/local/opt/fzf/shell/completion.bash
fi

# macOS-specific environment variables
export BROWSER="open"

# Add macOS-specific paths
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"