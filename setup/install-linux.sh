#!/bin/bash
# Linux-specific dotfiles installation script

set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.config/dotfiles}"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🐧 Installing Linux-specific dotfiles configurations..."

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

# Install shared configurations first
echo "📦 Installing shared configurations..."
bash "$DOTFILES_DIR/setup/install-shared.sh"

# Link X11 configurations
echo "🖥️  Setting up X11 configurations..."
sudo mkdir -p /etc/X11/xorg.conf.d/
if [[ -f "$DOTFILES_DIR/linux/00-keyboard.conf" ]]; then
    sudo ln -sf "$DOTFILES_DIR/linux/00-keyboard.conf" /etc/X11/xorg.conf.d/00-keyboard.conf
    echo "  Linked keyboard configuration"
fi
if [[ -f "$DOTFILES_DIR/linux/90-touchpad.conf" ]]; then
    sudo ln -sf "$DOTFILES_DIR/linux/90-touchpad.conf" /etc/X11/xorg.conf.d/90-touchpad.conf
    echo "  Linked touchpad configuration"
fi

# Link font configurations
echo "🔤 Setting up font configurations..."
mkdir -p "$HOME/.config/fontconfig/conf.d/"
if [[ -f "$DOTFILES_DIR/linux/75-noto-color-emoji.conf" ]]; then
    link_file "$DOTFILES_DIR/linux/75-noto-color-emoji.conf" "$HOME/.config/fontconfig/conf.d/75-noto-color-emoji.conf"
fi

# Link Linux-specific config directories
echo "⚙️  Setting up Linux-specific configurations..."
for config_dir in "$DOTFILES_DIR/linux"/*; do
    if [[ -d "$config_dir" ]]; then
        config_name=$(basename "$config_dir")
        # Skip scripts directory as it's handled separately
        if [[ "$config_name" != "scripts" ]]; then
            link_file "$config_dir" "$HOME/.config/$config_name"
        fi
    fi
done

# Make Linux-specific scripts executable
echo "🔨 Setting up Linux-specific scripts..."
if [[ -d "$DOTFILES_DIR/linux/scripts" ]]; then
    chmod +x "$DOTFILES_DIR/linux/scripts"/*
    
    # Create symlinks in ~/.local/bin for Linux scripts
    for script in "$DOTFILES_DIR/linux/scripts"/*; do
        if [[ -f "$script" && -x "$script" ]]; then
            script_name=$(basename "$script")
            link_file "$script" "$HOME/.local/bin/$script_name"
        fi
    done
fi

echo "✅ Linux dotfiles installation completed!"
echo "   Backup of existing files: $BACKUP_DIR"
echo "   NOTE: You may need to log out and back in for X11 changes to take effect"
echo "   NOTE: Restart your shell or run 'source ~/.bashrc' / 'source ~/.zshenv'"