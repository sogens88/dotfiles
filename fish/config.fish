set fish_greeting          
set TERM "xterm-256color"  
set BROWSER "microsoft-edge-stable"
set TERMINAL "kitty"
set -Ux WLR_RENDERER vulkan
set -Ux PYENV_ROOT $HOME/.pyenv
 
pyenv init - | source
bass source /etc/profile

export LANGUAGE="en_AU"
export LC_ALL=
export LC_CTYPE="en_AU.UTF-8"
export LANG="en_AU.UTF-8"
export XDG_RUNTIME_DIR="/run/user/1000"
export VDPAU_DRIVER="radeonsi"
export NNN_SHOW_HIDDEN=0
export NNN_PLUG='p:preview-tui;o:fzopen'
export NNN_FIFO="/tmp/nnn.fifo"
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_pro_icd64.json
export HOME="/home/jason"

set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent

function vi -d 'vi alias for nvim'
    nvim $argv
end

function vim -d 'vi alias for nvim'
    nvim $argv
end

# Colorscheme: Dracula
set -U fish_color_normal normal
set -U fish_color_command F8F8F2
set -U fish_color_quote F1FA8C
set -U fish_color_redirection 8BE9FD
set -U fish_color_end 50FA7B
set -U fish_color_error FFB86C
set -U fish_color_param FF79C6
set -U fish_color_comment 6272A4
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion BD93F9
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel --reverse
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_selected_background --background=brblack
set -U fish_pager_color_selected_description 
set -U fish_color_host_remote 
set -U fish_pager_color_selected_completion 
set -U fish_color_keyword 
set -U fish_color_option 
set -U fish_pager_color_background 
set -U fish_pager_color_secondary_background 
set -U fish_pager_color_selected_prefix 
set -U fish_pager_color_secondary_prefix 
set -U fish_pager_color_secondary_completion 
set -U fish_pager_color_secondary_description 


set -g spark_version 1.0.0
complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end

alias keyboard+='gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Keyboard.StepUp'
alias keyboard-='gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Keyboard.StepDown'
alias ls='exa -al --color=always --group-directories-first --icons --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons --icons' # tree listing
alias l.='exa -a | egrep "^\."'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias vim='nvim'
alias vi='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'
alias clear='/usr/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

bass source /usr/share/fzf/key-bindings.bash

starship init fish | source
neofetch | lolcat

set -gx PATH $HOME/.pyenv/bin $HOME/.local/bin $HOME/bin $HOME/.ghcup/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/jason/.ghcup/bin $PATH # ghcup-env
