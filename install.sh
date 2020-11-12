#!/usr/bin/sh
CWD=$(pwd)

LOG_FILE="$CWD/install $(date +%F).log"

OH_MY_ZSH_SRC=$CWD/.oh-my-zsh

VIM_SRC=$CWD/vim-config
VIM_DST=$HOME/.vim

ZSHRC_SRC=$CWD/zsh
ZSHRC_DST=$HOME/.zshrc

THEME=powerlevel10k
ZSH_THEME_SRC=$CWD/themes/$THEME
ZSH_THEME_DST=$OH_MY_ZSH_SRC/custom/themes/$THEME

CONFIG_OLD=$HOME/.config.old/

logit() {
    echo "[ $(date +'%F %X') ] - ${*}" >>$LOG_FILE
}

step_done() {
    logit "Done!!\n"
}

fetch_updates() {
    logit "Fetching updates"
    apt-get update
    step_done
}

install_dependencies() {
    local BIN=$1

    logit "Installing $BIN"
    apt-get install $BIN -y
    step_done
}

copy_files() {
    local SOURCE=$1
    local DESTINY=$2

    logit "Copying $SOURCE to $DESTINY"
    # mkdir -p $DESTINY
    cp -vr $SOURCE $DESTINY
    step_done
}

move_files() {
    local SOURCE=$1
    local DESTINY=$2

    logit "Moving $SOURCE to $DESTINY"
    mv -v $SOURCE $DESTINY
    step_done
}

echo "LOG FILE INSTALL DOTFILES AND CONFI -- $(date +'%F %X') --" >$LOG_FILE

fetch_updates

install_dependencies git
install_dependencies vim
install_dependencies zsh
install_dependencies curl
install_dependencies wget

logit "Getting NodeJS current Source"
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
step_done

install_dependencies nodejs

logit "Getting submodules"
git submodule update --init --recursive
step_done

copy_files $ZSH_THEME_SRC $ZSH_THEME_DST
copy_files $ZSHRC_SRC $ZSHRC_DST
copy_files $VIM_SRC $VIM_DST

mkdir -p $CONFIG_OLD
move_files $HOME/.bashrc $CONFIG_OLD
move_files $HOME/.profile $CONFIG_OLD

logit "Exporting ENV Variables"
export SHELL=/usr/bin/zsh
export ZSH=$CWD/.oh-my-zsh
echo /bin/bash >$HOME/.shell.pre-oh-my-zsh
chsh -s /bin/zsh
step_done

logit "Changing permission of Oh My ZSH"
chmod -v -R 700 $OH_MY_ZSH_SRC
step_done

logit "Changing group and owner"
chown -v -R $(whoami):$(whoami) $OH_MY_ZSH_SRC
zsh
