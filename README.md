# Personal Dotfiles for macOS

[![Test Dotfiles](https://github.com/USERNAME/dotfiles/workflows/Test%20Dotfiles/badge.svg)](https://github.com/USERNAME/dotfiles/actions)

A modern, well-structured dotfiles repository for macOS development environment setup using Homebrew, mise, and modern shell tools.

## ✨ Features

- **🚀 Modern Tools**: Neovim with lazy.nvim, Starship prompt, mise for runtime management
- **🛡️ Security First**: Pre-commit hooks, secret detection, comprehensive gitignore
- **⚡ Performance Optimized**: Lazy loading, efficient shell startup
- **📦 Package Management**: Homebrew + mise + sheldon for different tool categories
- **🔧 XDG Compliant**: Following modern configuration standards
- **🧪 CI/CD Ready**: GitHub Actions, automated testing, dependency updates

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
git clone https://github.com/USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the comprehensive update script
sh ~/dotfiles/update.sh
```

### Manual Installation Steps

```bash
# 1. Install packages
brew bundle

# 2. Link configuration files  
sh ~/dotfiles/scripts/linkDotfiles.sh

# 3. Update macOS settings
sh ~/dotfiles/scripts/updateMacSettings.sh

# 4. Verify installation
sh ~/dotfiles/scripts/verify.sh
```

## 🛠️ What's Included

### Development Tools
- **Editors**: Neovim (modern config), VS Code (30+ extensions)
- **Shell**: zsh with Starship prompt, optimized startup time
- **Version Control**: Git with extensive aliases and configuration
- **Runtimes**: Node.js v22, Python 3.13 (managed by mise)
- **Package Managers**: Homebrew, mise, sheldon, pipx, uv

### Terminal Enhancement
- **Prompt**: Starship (fast, customizable)
- **File Navigation**: eza, bat, fzf, ripgrep
- **Terminal Multiplexer**: tmux with modern configuration
- **Shell Plugins**: Auto-suggestions, syntax highlighting, completions

### Security & Quality
- **Pre-commit Hooks**: Shellcheck, secret detection, YAML/TOML validation
- **Git Security**: git-secrets integration, comprehensive .gitignore
- **CI/CD**: GitHub Actions for testing and validation

## 📁 Repository Structure

```
dotfiles/
├── .config/              # XDG Base Directory compliant configs
│   ├── git/             # Git configuration
│   ├── mise/            # Runtime version management  
│   ├── sheldon/         # Zsh plugin management
│   ├── starship.toml    # Prompt configuration
│   ├── direnv/          # Directory-based environment
│   └── uv/              # Python package manager
├── .github/             # GitHub Actions workflows
├── scripts/             # Installation and maintenance scripts
├── vim/                 # Legacy Vim configuration (fallback)
├── nvim/                # Modern Neovim configuration
├── zsh/                 # Modular zsh configuration
├── bin/                 # Custom utility scripts
└── Brewfile             # Homebrew packages and VS Code extensions
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
# Run all tests
.github/workflows/test.yml

# Test shell scripts
find . -name "*.sh" -exec shellcheck {} +

# Validate configurations
pre-commit run --all-files
```

## 📚 Documentation

- [Detailed Setup Guide](CLAUDE.md) - Comprehensive documentation
- [Shell Configuration](zsh/) - Modular zsh setup explanation
- [Neovim Setup](nvim/) - Modern Neovim configuration details

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
