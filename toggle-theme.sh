alacritty_theme() {
    theme=$1
    config_path=~/.config/alacritty/color.yml
    if ! test -f "$config_path"; then
        echo "$config_path does not exists"
        return
    fi

    sed -i "" -e "s/^colors: \*.*/colors: *$theme/g" $config_path

    echo "switched to $theme"
}

vi_theme() {
    for wix in `tmux list-windows -t main -F 'main:#{window_index}'`; do
        for tix in `tmux list-panes -t $wix -F 'main:#{window_index}.#{pane_index}.#{pane_tty}'`; do
            pat='(main:[0-9].[0-9]).(.*)'
            [[ $tix =~ $pat ]]
            _pane_tty="${BASH_REMATCH[2]}"
            _pane_id="${BASH_REMATCH[1]}"

            _nvim=$(ps -o state= -o comm= -t $_pane_tty | grep -c 'nvim')

            if [ $_nvim == 1 ]; then
                tmux if-shell -t "$_pane_id" "true" "send-keys -t $_pane_id Escape"
                tmux if-shell -t "$_pane_id" "true" "send-keys -t $_pane_id ':call ChangeBackground()' ENTER"
            fi

        done
    done
}

_light() {
    alacritty_theme gruvbox_light
    kitty @ set-colors --all --configured ~/.config/kitty/kitty-themes/gruvbox_light.conf
    rm -rf ~/.config/kitty/theme.conf && ln -s ~/.config/kitty/kitty-themes/gruvbox_light.conf ~/.config/kitty/theme.conf
    sed -i "" -e "s/^\([[:space:]]*\)\(export FZF_DEFAULT_OPTS=\)\(.*\)/\1\2\$fzf_theme_light/g" ~/.zshrc
    sed -i "" -e "s/^\(export BAT_THEME=\).*/\1\"gruvbox-light\"/g" ~/.zshrc
    sed -i "" -e "s/^\(set background=\).*/\1light/g" ~/.config/nvim/init.vim
    sed -i "" -e "s/\(.*active_window_border_color.*\)\".*\"/\1\"0xE03e5ea3\"/g" ~/.config/yabai/yabairc
}

_dark() {
    alacritty_theme gruvbox_dark
    kitty @ set-colors --all --configured ~/.config/kitty/kitty-themes/gruvbox_dark.conf
    rm -rf ~/.config/kitty/theme.conf && ln -s ~/.config/kitty/kitty-themes/gruvbox_dark.conf ~/.config/kitty/theme.conf
    sed -i "" -e "s/^\([[:space:]]*\)\(export FZF_DEFAULT_OPTS=\)\(.*\)/\1\2\$fzf_theme_dark/g" ~/.zshrc
    sed -i "" -e "s/^\(export BAT_THEME=\).*/\1\"gruvbox-dark\"/g" ~/.zshrc
    sed -i "" -e "s/^\(set background=\).*/\1dark/g" ~/.config/nvim/init.vim
    sed -i "" -e "s/\(.*active_window_border_color.*\)\".*\"/\1\"0xE04caf50\"/g" ~/.config/yabai/yabairc
}


case $1 in

    light)
        echo "Light"
        _light
        ;;

    dark)
        echo "Dark"
        _dark
        ;;

    *)
        echo "Unknown Option"
esac

vi_theme
