# Dotfiles

Personal dotfiles managed with [yadm](https://yadm.io/). Supports macOS and Linux (Raspberry Pi 5).

## Tracked Files

- `~/.zshrc##os.Darwin` — Zsh config for macOS (Homebrew paths, aliases, completions, starship)
- `~/.zshrc##os.Linux` — Zsh config for Linux (aliases, completions, starship)
- `~/.tmux.conf` — Tmux config (catppuccin theme, status bar)
- `~/.config/starship.toml` — Starship prompt config
- `~/Library/Application Support/com.mitchellh.ghostty/config` — Ghostty terminal config
- `~/.config/yadm/bootstrap` — Bootstrap script (handles Ghostty config path on Linux)

yadm uses [alternate files](https://yadm.io/docs/alternates) to select the right `.zshrc` based on the OS. On macOS, `.zshrc` symlinks to `.zshrc##os.Darwin`; on Linux, it symlinks to `.zshrc##os.Linux`.

## macOS Setup

```bash
# Install dependencies
brew install yadm tmux starship carapace fzf
brew install --cask font-jetbrains-mono-nerd-font

# Clone dotfiles
yadm clone git@github.com:joshferrara/dotfiles.git

# If any files aren't placed correctly
yadm checkout -- .

# Install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins (run inside a tmux session)
tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/install_plugins
```

## Raspberry Pi / Linux Setup

```bash
# Install dependencies
sudo apt update
sudo apt install -y zsh tmux fzf git curl

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install carapace
# See https://carapace-sh.github.io/carapace-bin/install.html

# Install yadm
sudo apt install -y yadm

# Clone dotfiles (yadm auto-selects the Linux .zshrc and runs bootstrap)
yadm clone git@github.com:joshferrara/dotfiles.git
yadm bootstrap

# Install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins (run inside a tmux session)
tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/install_plugins

# Set zsh as default shell
chsh -s $(which zsh)
```

The bootstrap script creates a symlink so Ghostty finds its config at `~/.config/ghostty/config` (the Linux-standard path), pointing to the macOS path where yadm checks out the file.

## Push Changes

After editing a config file:

```bash
yadm add -u
yadm commit -m "description of change"
yadm push
```

## Pull Changes

On another machine, to sync:

```bash
yadm pull
```

If tmux plugins changed, run `Prefix + I` (`Ctrl+b` then `Shift+i`) inside tmux to install them.
