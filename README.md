# Dotfiles

Multi-platform dotfiles configuration supporting both Linux (Arch Linux) and macOS. Organized for easy maintenance and platform-specific customization.

![Screenshot2022-06-2820:08:39](https://user-images.githubusercontent.com/29902722/176319226-c8ee3ad4-5592-4aab-8761-ee045f94098b.png)

## Quick Start

### Linux (Arch Linux)
- [ ] Make a Makefile for Linux installation
- [ ] Adjust configuration files for Archlinux

### macOS
```bash
git clone https://github.com/tiagovercosa/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles/macos
make install
```

## Directory Structure

```
├── linux/           # Linux-specific configurations
│   ├── qtile/       # Qtile window manager
│   ├── i3/          # i3 window manager  
│   ├── scripts/     # Linux-specific scripts
│   └── *.conf       # X11 configurations
└── macos/           # macOS-specific configurations
    ├── ghostty/     # Ghostty configurations
    ├── git/         # git configurations
    ├── nvim/        # Neovim configurations
    ├── r/           # R environments
    ├── tmux/        # Tmux configurations
    ├── vim/         # Vim configurations
    └── zsh/         # ZSH configurations
```

## Features

### Configurations
- **Shell**: Bash and Zsh
- **Vim**: Complete Vim configuration
- **Git**: Git configuration and aliases
- **Tmux**: Terminal multiplexer configuration

### Linux-Specific
- **Window Managers**: i3wm and Qtile configurations
- **X11**: Keyboard, touchpad, and font configurations
- **Scripts**: Arch Linux package management and system utilities

