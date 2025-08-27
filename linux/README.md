# Linux-specific configurations

This directory contains Linux-specific configurations for the dotfiles setup.

## Setup Instructions

Run the Linux setup script:
```bash
./setup/install-linux.sh
```

This will install both shared and Linux-specific configurations.

## Directory Structure

- `linux-specific.sh`: Linux-specific shell configurations
- `00-keyboard.conf`: X11 keyboard configuration
- `75-noto-color-emoji.conf`: Font configuration for emoji support
- `90-touchpad.conf`: X11 touchpad configuration
- `qtile/`: Qtile window manager configuration
- `i3/`: i3 window manager configuration
- `i3blocks/`: i3blocks status bar configuration
- `scripts/`: Linux-specific utility scripts

## Configurations Included

### Window Managers
- **i3wm**: Tiling window manager configuration
- **Qtile**: Python-based tiling window manager

### System Configurations
- **X11**: Keyboard and touchpad configurations
- **Fonts**: Emoji font configuration with Noto Color Emoji

### Scripts
- `arch-update`: Check for Arch Linux package updates
- `alfetch`: System information script
- `battery2`: Battery status monitoring
- `module-calendar`: Calendar module
- `my_i3lock`: Custom i3lock wrapper
- `volume-pipewire`: PipeWire volume control

## Notes

- X11 configurations require sudo access and will be placed in `/etc/X11/xorg.conf.d/`
- Some configurations are specific to Arch Linux (e.g., arch-update script)
- Window manager configurations assume certain packages are installed