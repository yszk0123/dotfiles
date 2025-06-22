# Personal Dotfiles for macOS

A modern, well-structured dotfiles repository for macOS development environment setup using Homebrew, mise, and modern shell tools.

## ✨ Features

- **🚀 Modern Tools**: Neovim with lazy.nvim, Starship prompt, mise for runtime management
- **🛡️ Security First**: Pre-commit hooks, secret detection, comprehensive gitignore
- **⚡ Performance Optimized**: Lazy loading, efficient shell startup
- **📦 Package Management**: Homebrew + mise + sheldon for different tool categories
- **🔧 Modular Design**: Clean separation of concerns with individual configuration modules

## 🚀 Quick Start

### Prerequisites

1. Install Xcode Command Line Tools:
   ```bash
   xcode-select --install
   ```

2. Set required environment variable:
   ```bash
   export ZDOTDIR="$HOME/.zsh"
   ```

### Installation

```bash
# Clone the repository
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Run the comprehensive update script
sh ~/dotfiles/update.sh
```

### Manual Installation Steps

```bash
# 1. Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install packages
brew bundle

# 3. Link configuration files
sh ~/dotfiles/scripts/linkDotfiles.sh

# 4. Update macOS settings
sh ~/dotfiles/scripts/updateMacSettings.sh

# 5. Verify installation
sh ~/dotfiles/scripts/verify.sh
```

## 🛠️ What's Included

### Development Tools
- **Editors**: Neovim (modern config), VS Code (comprehensive extensions)
- **Shell**: zsh with Starship prompt, optimized startup time
- **Version Control**: Git with extensive aliases and configuration
- **Runtimes**: Node.js v22, Python 3.13 (managed by mise)
- **Package Managers**: Homebrew, mise, sheldon, uv

### Terminal Enhancement
- **Prompt**: Starship (fast, customizable)
- **File Navigation**: eza, bat, fzf, ripgrep
- **Terminal Multiplexer**: tmux with modern configuration
- **Shell Plugins**: Auto-suggestions, syntax highlighting, completions

### Security & Quality
- **Git Security**: Comprehensive .gitignore with security patterns
- **Key Management**: Karabiner Elements for keyboard customization

## 📁 Repository Structure

```
dotfiles/
├── .config/             # XDG Base Directory compliant configs
│   ├── karabiner/       # Keyboard mapping configuration
│   ├── mise/            # Runtime version management
│   ├── sheldon/         # Zsh plugin management
│   ├── starship.toml    # Prompt configuration
│   ├── nvim/            # Modern Neovim configuration
│   ├── git/             # Git configuration
│   ├── ghostty/         # Terminal configuration
│   └── uv/              # Python package manager config
├── scripts/             # Installation and maintenance scripts
│   ├── common/          # Shared utilities
│   └── install/         # Individual tool installers
├── zsh/                 # Modular zsh configuration
├── bin/                 # Custom utility scripts
├── Brewfile             # Homebrew packages and VS Code extensions
├── pyproject.toml       # Python project configuration
├── uv.lock              # Python dependency lock file
└── CLAUDE.md            # Detailed setup documentation
```

## 🔧 Configuration

### Environment Variables

| Variable | Purpose | Required |
|----------|---------|----------|
| `ZDOTDIR` | Zsh configuration directory | ✅ |
| `GITLAB_PRIVATE_TOKEN` | GitLab API access | Optional |
| `HOMEBREW_GITHUB_API_TOKEN` | Avoid GitHub rate limits | Optional |

### Font Setup

Install and configure Nerd Font for full icon support:

```bash
# Font is included in Brewfile, but manual setup needed:
# 1. Open Terminal app preferences
# 2. Select font: "Hack Nerd Font"
# 3. Restart terminal
```

## 🚀 Usage

### Regular Maintenance

```bash
# Comprehensive update (recommended)
sh ~/dotfiles/update.sh

# Individual components
brew bundle                    # Update Homebrew packages
mise upgrade                   # Update runtimes
sheldon update                 # Update shell plugins
sh ~/dotfiles/scripts/verify.sh # Verify configuration
```

### Development Workflow

```bash
# Setup pre-commit hooks
pre-commit install

# Run tests locally
pre-commit run --all-files

# Check shell startup performance
time zsh -i -c exit
```

## 🔧 Customization

### Adding New Tools

1. **CLI Tools**: Add to `Brewfile`
2. **Shell Plugins**: Add to `.config/sheldon/plugins.toml`
3. **Runtimes**: Configure in `.config/mise/config.toml`
4. **VS Code Extensions**: Add to `Brewfile` under `vscode` entries

### Performance Tuning

- Shell startup optimizations in `zsh/performance.zsh`
- Lazy loading configurations for heavy tools
- Efficient PATH management

## 🧪 Testing

```bash
# Test shell scripts with shellcheck
find . -name "*.sh" -exec shellcheck {} +

# Validate configurations with pre-commit
pre-commit run --all-files

# Manual verification
sh ~/dotfiles/scripts/verify.sh
```

## 📚 Documentation

- [Detailed Setup Guide](CLAUDE.md) - Comprehensive documentation
- [Shell Configuration](zsh/) - Modular zsh setup explanation
- [Custom Scripts](bin/) - Utility scripts and tools

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `pre-commit run --all-files`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Homebrew](https://brew.sh/) - Package management
- [mise](https://mise.jdx.dev/) - Runtime management
- [Starship](https://starship.rs/) - Cross-shell prompt
- [sheldon](https://sheldon.cli.rs/) - Zsh plugin manager
