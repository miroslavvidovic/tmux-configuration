<div align="center">

# tmux-configuration
My tmux and tmuxinator configuration files

<img src="http://icons.iconarchive.com/icons/alecive/flatwoken/512/Apps-Terminator-icon.png" height="250px" width="250px">

</div>

## Installation
Clone the repository and run the setup-tmux.sh script.

## Requirements
- [powerline fonts](https://github.com/powerline/fonts) for status line symbols

## Scripts
- tmux-ssh - Detect if a shell is controlled through SSH and display it to the user
- tmux-wifi - Display wifi signal strength

If you wish to use the scripts in your tmux segments add them to your path and call them in your tmux configuration.
```
set -g status-right '#[fg=green] #(tmux-wifi.sh)'
```

## Plugins
This configuration uses the Tmux Plugin Manager [tpm](https://github.com/tmux-plugins/tpm)
and the following plugins:

- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Persists tmux environment across system restarts.
- [tmux-open](https://github.com/tmux-plugins/tmux-open) - Quickly open a highlighted file or URL.
- [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) - Enhance tmux search.
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - Copy to system clipboard.
- [tmux-sidebar](https://github.com/tmux-plugins/tmux-sidebar) - Sidebar with the directory tree.

## Themes
Themes are installed in `$HOME/.tmux/themes`. You can use them by editing your `tmux.conf`
```
# Theme {{{
    source-file "${HOME}/.tmux/themes/my-theme.tmuxtheme"
#}}}
```
