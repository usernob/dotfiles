# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=50000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS

# compile .zshrc
ZSHRC_COMPILED=${ZDOTDIR:-$HOME}/.zshrc.zwc
if [[ ! -f $ZSHRC_COMPILED || ${ZDOTDIR:-$HOME}/.zshrc -nt $ZSHRC_COMPILED ]]; then
  zcompile ${ZDOTDIR:-$HOME}/.zshrc
fi


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 4); do time $shell -i -c exit; done
}

# manual compinit
# autoload -Uz compinit
# zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
# mkdir -p "${zcompdump:h}"
# if [[ ! -f $zcompdump || $(find $zcompdump -mtime +7 2>/dev/null) ]]; then
#   compinit -d "$zcompdump"
# else
#   compinit -C -d "$zcompdump"
# fi

# antidote
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote/functions)
autoload -Uz $fpath[-1]/antidote

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi

# Source your static plugins file.
source $zsh_plugins

# load on background
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(dircolors -b)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -A --color=always --icons --group-directories-first $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

alias ls="eza --color=always --icons --group-directories-first"
alias la="eza --color=always --icons --group-directories-first -lA"
