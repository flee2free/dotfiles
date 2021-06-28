# https://github.com/skywind3000/vim/blob/master/etc/zshrc.zsh

ENABLE_CORRECTION="false"
export EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOROOT="/usr/local/Cellar/go/1.16.3/libexec/"
export GOPATH="$HOME/go"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/lib/flutter/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rubies/ruby-3.0.1/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export BAT_THEME="gruvbox-light"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.0.1.jdk/Contents/Home

export NAVI_PATH="/Users/bbudhathoki/Cheat"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Path to VIMRC
MYVIMRC="~/.config/nvim/init.vim"

plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting common-aliases
				colored-man-pages rand-quote brew)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# ZSH_THEME="spaceship"
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=0
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false

# autoload -U promptinit; promptinit
# prompt pure

# Figure out a better way to place these aliases
alias cls="clear"
alias edit="open -a bbedit"
alias @="open -a "
alias finder="open -a finder"
alias preview="open -a preview"
alias zconf="mate ~/.zshrc"
alias studio="open -a 'visual studio code'"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias marta="open -a Marta"

alias t="timetrap"
alias b="buku"

alias l='exa --classify --long --group --header'
alias ll='l'
alias ls='exa --classify --across --group-directories-first --sort name'

alias la='exa -laFh' #long all classify header
alias lh='exa --long --list-dirs .* --sort Name --header'

alias lr='exa --sort Name --long --recurse'
alias lsr='exa --sort Name --recurse --classify'
alias lar='exa --sort Name --long --recurse --all -I .git'

alias lt='exa --sort Name --long --tree' # --level=2
alias lst='exa --sort Name --tree'
alias lat='exa --sort Name --long --tree --all -I .git'

# --git-ignores files listed in .gitignore
alias llt='exa --all --group-directories-first --git-ignore --tree --level=2 --ignore-glob ".git"'

# Todo: Check out the --git option as well

# List only directories
alias lsd='exa --only-dirs'

alias lsx='ll --sort=Extension'     # Lists sorted by extension (GNU only).
alias lsk='ll --sort=size -r'       # Lists sorted by size, largest last.
alias lst='ll --sort=modified -r'   # Lists sorted by date, most recent last.
alias lsc='llt -m'                  # Lists sorted by date, most recent last, shows change time.
alias lsu='llt -u'                  # Lists sorted by date, most recent last, shows access time.

alias tml="tmux ls"
alias tma="tmux attach -t "
alias tmk="tmux kill-session -t "

# Got these alias from a medium post
alias grep="grep --color=auto"
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz4='tar -xjvf'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use lf to switch directories and bind it to ctrl-o
lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s '^o' 'lfcd\n'

# Use fuzzy find with tree listing then cd
cd_with_fzf() {
	cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 2
};
bindkey -s '^f' 'cd_with_fzf\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# History in cache directory:
HISTSIZE=1000000000
SAVEHIST=1000000000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion

set -o ignoreeof  # Same as setting IGNOREEOF=10

# https://superuser.com/questions/1242884/change-zsh-auto-titles-to-hide-user-and-host
# https://stackoverflow.com/questions/13660636/what-is-percent-tilde-in-zsh/13660697#13660697
DISABLE_AUTO_TITLE="false"
ZSH_THEME_TERM_TITLE_IDLE="%2~"

# https://superuser.com/questions/633926/
# https://tldp.org/HOWTO/Xterm-Title-4.html
# precmd() { print -Pn '\e]0; $(basename "$PWD") \a' }

# https://github.com/kovidgoyal/kitty/issues/610
# function set-title-precmd() {
    # printf "\e]2;%s\a" "${PWD/#$HOME/~}"
# }
#
# function set-title-preexec() {
    # printf "\e]2;%s\a" "$1"
# }
#
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd set-title-precmd
# add-zsh-hook preexec set-title-preexec

# https://github.com/spaceship-prompt/spaceship-prompt/issues/157
# Mode Change Configuration VI Mode
function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        vicmd)      print -n '\033[1 q';; # block cursor
        viins|main) print -n '\033[5 q';; # line cursor
    esac

    # disabling this as the spaceship vi-mode change looks ugly
    # zle reset-prompt zle -R # this was the line that did the trick

    zle reset-prompt zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# To know more about ZLE (ZSH Line Editor)
# https://sgeb.io/posts/2014/04/zsh-zle-custom-widgets/

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# FZF Color Scheme
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

    fzf_theme_dark="
        --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
        --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
    "

    fzf_theme_light="
        --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
        --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
    "

  export FZF_DEFAULT_OPTS=$fzf_theme_light
}
_gen_fzf_default_opts

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug load

# >>> conda init >>>
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.zsh hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# fi
#
# unset __conda_setup
# <<< conda init <<<

# Note:
# https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s#3448551
# used ctrl s in vim to save, if this messes up anything in the future you know
# where to look at

# https://github.com/kovidgoyal/kitty/issues/930
# https://itectec.com/superuser/whats-the-zsh-equivalent-of-bashs-prompt_command/
# custom tab title for Kitty (doesn't work) : Needed to disable auto title
# precmd() {print -Pn "\e]0;%~\a"}

ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=180"

# Keybinding for Autosuggestion
bindkey '^n' autosuggest-accept

# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# https://the.exa.website/docs/colour-themes
export LS_COLORS="*.mp3=38;5;141"

eval $(thefuck --alias)
