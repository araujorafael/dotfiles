if status is-interactive
    # Commands to run in interactive sessions can go here
    # Emacs vars
    set -g EMACSDIR $HOME/.emacs.d
    set -g DOOMDIR $HOME/.doom.d
    set -g DOOMLOCALDIR $HOME/.emacs.d/.local

    fish_add_path -gp $EMACSDIR/bin

    # Load asdf to terminal session and add the autocomplete to fish
    source ~/.asdf/asdf.fish
    . ~/.asdf/plugins/java/set-java-home.fish

    # Add custom alias to deal with dotfiles
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    # load ssh-agent
    eval (ssh-agent -c)
end
