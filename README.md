# Dotfiles

Multi-platform dotfiles configuration supporting both Linux (Arch Linux) and macOS. Organized for easy maintenance and platform-specific customization.

![Screenshot2022-06-2820:08:39](https://user-images.githubusercontent.com/29902722/176319226-c8ee3ad4-5592-4aab-8761-ee045f94098b.png)

## Quick Start

### Linux (Arch Linux)
```bash
git clone https://github.com/tiagovercosa/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./setup/install-linux.sh
```

### macOS
```bash
git clone https://github.com/tiagovercosa/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./setup/install-macos.sh
```

### Shared configurations only
```bash
git clone https://github.com/tiagovercosa/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./setup/install-shared.sh
```

## Directory Structure

```
├── linux/           # Linux-specific configurations
│   ├── qtile/       # Qtile window manager
│   ├── i3/          # i3 window manager  
│   ├── scripts/     # Linux-specific scripts
│   └── *.conf       # X11 configurations
├── macos/           # macOS-specific configurations
│   ├── brew/        # Homebrew configurations
│   ├── defaults/    # macOS system preferences
│   ├── terminal/    # Terminal configurations
│   └── scripts/     # macOS-specific scripts
├── shared/          # Cross-platform configurations
│   ├── config/      # Application configs (tmux, git, zsh, etc.)
│   ├── vim/         # Vim configuration
│   ├── scripts/     # Cross-platform scripts
│   └── shell files  # bashrc, zshenv, etc.
└── setup/           # Setup scripts for each platform
```

## Features

### Shared Configurations
- **Shell**: Bash and Zsh with intelligent OS detection
- **Vim**: Complete Vim configuration with plugins
- **Git**: Git configuration and aliases
- **Tmux**: Terminal multiplexer configuration
- **Development tools**: Various development environment configs

### Linux-Specific
- **Window Managers**: i3wm and Qtile configurations
- **X11**: Keyboard, touchpad, and font configurations
- **Scripts**: Arch Linux package management and system utilities

### macOS-Specific
- **Homebrew**: Package management and installation
- **System Preferences**: Automated macOS defaults configuration
- **Terminal**: Terminal.app and iTerm2 configurations

## OS Detection

The dotfiles automatically detect your operating system and load appropriate configurations:

- **Linux**: Sources `linux/linux-specific.sh`
- **macOS**: Sources `macos/macos-specific.sh`

This enables seamless cross-platform usage while maintaining platform-specific optimizations.

## Installation Notes

- **Backup**: All existing dotfiles are automatically backed up before installation
- **Permissions**: Linux installation may require sudo for X11 configurations
- **Shell restart**: You may need to restart your shell after installation

## Customization

Each platform directory contains its own README with specific customization instructions:
- [Linux Configuration Guide](linux/README.md)
- [macOS Configuration Guide](macos/README.md)

<!-- ## Configuration files that are used to customize your Linux installation. -->
