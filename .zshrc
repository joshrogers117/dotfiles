export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PYTHONPATH="$HOME/Library/Python/3.9/lib/python/site-packages:$PYTHONPATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/Users/joshferrara/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias cc="claude --dangerously-skip-permissions"
mux() {
  local name="${1:-dev}" dir="${2:-.}"
  dir="$(cd "$dir" && pwd)"

  tmux new-session -d -s "$name" -c "$dir"
  tmux rename-window -t "$name:0" git
  tmux send-keys -t "$name:0" "lazygit" Enter

  tmux new-window -t "$name" -c "$dir"
  tmux rename-window -t "$name:1" editor
  tmux send-keys -t "$name:1" "nvim" Enter

  tmux new-window -t "$name" -c "$dir"
  tmux rename-window -t "$name:2" claude
  tmux send-keys -t "$name:2" "claude --dangerously-skip-permissions" Enter

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$name:0"
  else
    tmux attach -t "$name:0"
  fi
}
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Completions: carapace + fzf-tab
autoload -Uz compinit && compinit
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source <(carapace _carapace zsh)

# fzf-tab styling
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format ''
zstyle ':fzf-tab:*' fzf-flags --color=fg:#cdd6f4,hl:#f38ba8,fg+:#cdd6f4,bg+:#313244,hl+:#f38ba8,info:#f9e2af,prompt:#a6e3a1,pointer:#f5c2e7,marker:#f5c2e7,header:#89b4fa

# Starship prompt
eval "$(starship init zsh)"
