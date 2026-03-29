# Auto-start tmux on login (but not inside an existing tmux or SSH session)
if status is-interactive
    and not set -q TMUX
    and not set -q SSH_TTY
    exec tmux new-session -A -s main
end

starship init fish | source
zoxide init fish | source

# Aliases
alias ls='eza --icons'
alias ll='eza --icons -la'
alias cat='bat'

alias open='yazi'        # file manager
alias top='btop'         # system monitor
alias info='fastfetch'   # system info
alias music='pamixer --help && pamixer' # audio mixer
alias network='nmtui'    # network manager

alias vol='pamixer --get-volume'
alias vol+='pamixer --increase 5'
alias vol-='pamixer --decrease 5'

# Welcome message
function fish_greeting
    echo ""
    echo "  welcome to tty-os"
    echo ""
    echo "  commands:"
    echo "    open       — file manager"
    echo "    top        — system monitor"
    echo "    info       — system info"
    echo "    music      — audio mixer"
    echo "    network    — network settings"
    echo "    micro      — text editor"
    echo "    tmux       — terminal multiplexer"
    echo ""
    echo "  tmux shortcuts:"
    echo "    ctrl+a c   — new window"
    echo "    ctrl+a %   — split vertical"
    echo "    ctrl+a \"   — split horizontal"
    echo "    ctrl+a d   — detach (session stays alive)"
    echo "    ctrl+a arrows — navigate panes"
end
