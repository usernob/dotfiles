export FZF_DEFAULT_OPTS='
  --bind=alt-up:toggle+up,alt-down:toggle+down,tab:down,btab:up
  --color=16,fg:-1,fg+:15,bg:-1,bg+:19,hl:1,hl+:9
  --color=gutter:0,separator:0,prompt:1,pointer:19,marker:3,spinner:5,header:10,preview-border:20
  --prompt="/ " --marker="+" --pointer="◆" 
  --separator="─" --scrollbar="│" --layout=reverse --info=right
  --preview-border=sharp --border=none --highlight-line
  --cycle +e -x'

export _ZO_FZF_OPTS="${FZF_DEFAULT_OPTS:-} --height 40% --nth=2 --read0 --preview 'eza --color=always --icons --group-directories-first {2..}' --preview-window=down,50%,sharp"

export EDITOR=nvim
export MANPAGER='nvim +Man!'
