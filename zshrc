# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export BAT_THEME="gruvbox-dark"
# export BAT_THEME="gruvbox-light"

# theunraveler
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting common-aliases
				colored-man-pages rand-quote brew git zsh-z)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh
# npm install --global pure-prompt
# autoload -U promptinit; promptinit
# prompt pure

# Put a space infront of a command to exclude it from the history
setopt histignorespace
set -o ignoreeof  # Same as setting IGNOREEOF=10

# Prevent the TMUX client to exit
# set -o ignoreeof

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
alias marta="open -a Marta"

alias l="lsd -lFh"
alias ls="lsd"
alias la="lsd -lAFh"
alias ll="lsd -lh"
alias lh="lsd -ld .?*"

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

# List only directories
# alias lsd='/bin/ls -l | grep "^d"'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Mode Change Configuration VI Mode
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt

    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

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

# Setting up Java Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.0.1.jdk/Contents/Home

# Keybinding for Autosuggestion
bindkey '^n' autosuggest-accept

# History in cache directory:
HISTSIZE=1000000000
SAVEHIST=1000000000

# >>> conda init >>>
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.zsh hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# fi
#
# unset __conda_setup
# <<< conda init <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
    export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "

  # Solarized Light color scheme for fzf
  # export FZF_DEFAULT_OPTS="
   # --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   # --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  # "
}
_gen_fzf_default_opts

# Note:
# https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s#3448551
# used ctrl s in vim to save, if this messes up anything in the future you know
# where to look at
