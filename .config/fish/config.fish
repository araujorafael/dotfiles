if status is-interactive
  # Commands to run in interactive sessions can go here
  neofetch
  set -g LANG en_US.UTF-8
  # Emacs vars
  set -g EMACSDIR $HOME/.emacs.d
  set -g DOOMDIR $HOME/.doom.d
  set -g DOOMLOCALDIR $HOME/.emacs.d/.local

  fish_add_path -gp $EMACSDIR/bin
  fish_add_path -gp $HOME/bin

  # Load asdf to terminal session and add the autocomplete to fish
  source ~/.asdf/asdf.fish
  . ~/.asdf/plugins/java/set-java-home.fish

  # Add custom alias to deal with dotfiles
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias g='git'
end

### Fish is not POSIX complient, to flatpack app appear on KDE plasma
# Add flatpak exports to PATH
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

# Append local bin folder to PATH
set -a PATH ~/.local/bin
