#!/usr/bin/env bash

cd $HOME
echo ".cfg" >> .gitignore
git clone --bare git@github.com:araujorafael/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout ./

### Emacs instalation
pamac install --no-confirm \
    emacs \
    flatpak \
    libpamac-flatpak-plugin \
    fd \
    git \
    curl \
    ripgrep \
    rofi \
    neofetch \
    tilix \
    cmake \
    make \
    direnv \
    shellcheck \
    rlwrap \
    tidy

### Instal base devel....
pacman -Sy base-devel

### Install and set fish shell as default
pamac -S fish --no-confirm
chsh -s /bin/fish
fish

### Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
source ~/.asdf/asdf.fish
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

### TODO: Add Java, clojure, javascript asdf instalaltions
asdf plugin-add java
asdf install java adoptopenjdk-openj9-12.0.0+33.openj9-0.13.0
asdf global java adoptopenjdk-openj9-12.0.0+33.openj9-0.13.0
. ~/.asdf/plugins/java/set-java-home.fish

asdf plugin-add clojure
asdf install clojure 1.10.3.1040
asdf global clojure 1.10.3.1040
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
if ls $HOME/bin
   echo "home bin folder already exists"
else
    echo "Creating home bin folder"
    mkdir $HOME/bin
end
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
mv lein $HOME/bin
chmod a+x ~/bin/lein
lein

asdf add-plugin nodejs
asdf install node latest
asdf global node latest
npm install -g stylelint js-beautify
asdf reshim

###### doom emacs download and install
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
