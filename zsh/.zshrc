# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=50000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/usernob/.zshrc'

# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# source "${ZINIT_HOME}/zinit.zsh"

ZPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/@zpm"
if [[ ! -d $ZPM_HOME ]]; then
  mkdir -p "$(dirname $ZPM_HOME)"
  git clone --recursive https://github.com/zpm-zsh/zpm "$ZPM_HOME"
fi
source "${ZPM_HOME}/zpm.zsh"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 4); do time $shell -i -c exit; done
}

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# zinit light Aloxaf/fzf-tab
#
# zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit ice lucid wait'0'
# zinit light joshskidmore/zsh-fzf-history-search
#
# zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit load zsh-users/zsh-history-substring-search
# zinit ice wait atload'_history_substring_search_config'

zpm load Aloxaf/fzf-tab

zpm load zsh-users/zsh-autosuggestions
zpm load zdharma-continuum/fast-syntax-highlighting
zpm load zsh-users/zsh-completions

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(dircolors -b)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

export FZF_DEFAULT_OPTS='
  --bind=alt-up:toggle+up,alt-down:toggle+down,tab:down,btab:up
  --color=16,fg:-1,fg+:15,bg:-1,hl:1,hl+:9,prompt:1,pointer:2,marker:3,spinner:5,header:10
  --preview-window="border-rounded" --prompt="/ " --marker="+" --pointer="◆"
  --separator="─" --scrollbar="│" --layout="reverse" --info="right"
  --cycle +e -x'

export EDITOR=nvim
export MANPAGER='nvim +Man!'

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons --group-directories-first $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

alias ls="eza --color=always --icons --group-directories-first"
alias la="eza --color=always --icons --group-directories-first -lA"

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi
