#!/bin/bash
# macOS-specific dotfiles installation script

set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.config/dotfiles}"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🍎 Installing macOS-specific dotfiles configurations..."

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to safely link files
link_file() {
    local src="$1"
    local dest="$2"
    
    if [[ -e "$dest" || -L "$dest" ]]; then
        echo "  Backing up existing $dest to $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi
    
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo "  Linked $src -> $dest"
}

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "📦 Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for this session
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install shared configurations first
echo "📦 Installing shared configurations..."
bash "$DOTFILES_DIR/setup/install-shared.sh"

# Install Homebrew packages
echo "🍺 Installing Homebrew packages..."
if [[ -f "$DOTFILES_DIR/macos/brew/Brewfile" ]]; then
    brew bundle --file="$DOTFILES_DIR/macos/brew/Brewfile"
fi

# Apply macOS system preferences
echo "⚙️  Applying macOS system preferences..."
if [[ -f "$DOTFILES_DIR/macos/defaults/macos-defaults.sh" ]]; then
    bash "$DOTFILES_DIR/macos/defaults/macos-defaults.sh"
fi

# Link macOS-specific config directories
echo "📁 Setting up macOS-specific configurations..."
for config_dir in "$DOTFILES_DIR/macos"/*; do
    if [[ -d "$config_dir" ]]; then
        config_name=$(basename "$config_dir")
        # Skip special directories
        if [[ "$config_name" != "scripts" && "$config_name" != "brew" && "$config_name" != "defaults" && "$config_name" != "terminal" ]]; then
            link_file "$config_dir" "$HOME/.config/$config_name"
        fi
    fi
done

# Make macOS-specific scripts executable
echo "🔨 Setting up macOS-specific scripts..."
if [[ -d "$DOTFILES_DIR/macos/scripts" ]]; then
    chmod +x "$DOTFILES_DIR/macos/scripts"/*
    
    # Create symlinks in ~/.local/bin for macOS scripts
    for script in "$DOTFILES_DIR/macos/scripts"/*; do
        if [[ -f "$script" && -x "$script" ]]; then
            script_name=$(basename "$script")
            link_file "$script" "$HOME/.local/bin/$script_name"
        fi
    done
fi

# Setup Terminal/iTerm2 if configurations exist
if [[ -d "$DOTFILES_DIR/macos/terminal" ]]; then
    echo "🖥️  Terminal configurations available in $DOTFILES_DIR/macos/terminal"
    echo "   Please manually import these into Terminal.app or iTerm2"
fi

echo "✅ macOS dotfiles installation completed!"
echo "   Backup of existing files: $BACKUP_DIR"
echo "   NOTE: Some changes may require restarting applications or logging out/in"
echo "   NOTE: Restart your shell or run 'source ~/.bashrc' / 'source ~/.zshenv'"