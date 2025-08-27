#!/bin/bash
# Shared dotfiles installation script

set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.config/dotfiles}"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🔧 Installing shared dotfiles configurations..."

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

# Link shell configurations
echo "📝 Setting up shell configurations..."
link_file "$DOTFILES_DIR/shared/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/shared/bash_aliases" "$HOME/.bash_aliases"
link_file "$DOTFILES_DIR/shared/bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES_DIR/shared/zshenv" "$HOME/.zshenv"

# Link vim configuration
echo "✏️  Setting up vim configurations..."
link_file "$DOTFILES_DIR/shared/vim" "$HOME/.vim"

# Link shared config directories
echo "⚙️  Setting up application configurations..."
for config_dir in "$DOTFILES_DIR/shared/config"/*; do
    if [[ -d "$config_dir" ]]; then
        config_name=$(basename "$config_dir")
        link_file "$config_dir" "$HOME/.config/$config_name"
    fi
done

# Make scripts executable and add to PATH
echo "🔨 Setting up shared scripts..."
if [[ -d "$DOTFILES_DIR/shared/scripts" ]]; then
    chmod +x "$DOTFILES_DIR/shared/scripts"/*
    
    # Create symlinks in ~/.local/bin for shared scripts
    mkdir -p "$HOME/.local/bin"
    for script in "$DOTFILES_DIR/shared/scripts"/*; do
        if [[ -f "$script" && -x "$script" ]]; then
            script_name=$(basename "$script")
            link_file "$script" "$HOME/.local/bin/$script_name"
        fi
    done
fi

echo "✅ Shared dotfiles installation completed!"
echo "   Backup of existing files: $BACKUP_DIR"
echo "   NOTE: You may need to restart your shell or run 'source ~/.bashrc' / 'source ~/.zshenv'"