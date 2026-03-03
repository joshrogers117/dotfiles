# Dotfiles

Personal dotfiles managed with [yadm](https://yadm.io/).

## Tracked Files

- `~/.zshrc` — Zsh config (aliases, completions, starship)
- `~/.tmux.conf` — Tmux config (catppuccin theme, status bar)
- `~/.config/starship.toml` — Starship prompt config
- `~/Library/Application Support/com.mitchellh.ghostty/config` — Ghostty terminal config

## Fresh Machine Setup

```bash
# Install dependencies
brew install yadm tmux starship carapace fzf
brew install --cask font-jetbrains-mono-nerd-font

# Clone dotfiles
yadm clone git@github.com:joshferrara/dotfiles.git

# If any files aren't placed correctly
yadm checkout -- .zshrc .tmux.conf .config/starship.toml "Library/Application Support/com.mitchellh.ghostty/config"

# Install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins (run inside a tmux session)
tmux source-file ~/.tmux.conf && ~/.tmux/plugins/tpm/bin/install_plugins
```

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
