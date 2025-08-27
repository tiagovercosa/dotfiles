# macOS-specific configurations

## Setup Instructions

1. Install Homebrew:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Run the macOS setup script:
   ```bash
   ./setup/install-macos.sh
   ```

## Directory Structure

- `brew/`: Homebrew configurations and package lists
- `defaults/`: macOS system preferences via `defaults` command
- `terminal/`: Terminal.app and iTerm2 configurations
- `scripts/`: macOS-specific utility scripts

## Applications

The macOS setup will install and configure:
- Homebrew packages for development
- macOS system preferences
- Terminal configurations
- Application-specific settings