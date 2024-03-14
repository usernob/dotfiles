if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting


set PATH $HOME/.local/bin $HOME/.cargo/bin $PATH

function .runsudo --description 'Run current command line as root'
    commandline -C 0
    commandline -i 'sudo '
    commandline -i $history[1]
    commandline -f execute
end
bind \es .runsudo

starship init fish | source

zoxide init --cmd cd fish | source
