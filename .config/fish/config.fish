if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g EMACSDIR $HOME/.emacs.d
    set -g DOOMDIR $HOME/.doom.d
    set -g DOOMLOCALDIR $HOME/.emacs.d/.local

    fish_add_path -gp $EMACSDIR/bin

    source ~/.asdf/asdf.fish

    . ~/.asdf/plugins/java/set-java-home.fish
end
