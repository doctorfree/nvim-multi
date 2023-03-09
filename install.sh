#!/bin/bash
#
# install.sh - install and initialize the nvim-multi neovim configuration

have_git=$(type -p git)
have_nvim=$(type -p nvim)
[ "${have_git}" ] || {
  echo "Install script requires git but git not found"
  echo "Please install git and retry this install script"
  exit 1
}
[ "${have_nvim}" ] || {
  echo "Install script requires neovim but nvim not found"
  echo "Please install neovim and retry this install script"
  exit 1
}

[ -d $HOME/.config/nvim-multi ] && {
  echo "Backing up existing nvim-multi config as $HOME/.config/nvim-multi-bak$$"
  mv $HOME/.config/nvim-multi $HOME/.config/nvim-multi-bak$$
}

[ -d $HOME/.local/share/nvim-multi ] && {
  echo "Backing up existing nvim-multi plugins as $HOME/.local/share/nvim-multi-bak$$"
  mv $HOME/.local/share/nvim-multi $HOME/.local/share/nvim-multi-bak$$
}

[ -d $HOME/.local/state/nvim-multi ] && {
  echo "Backing up existing nvim-multi state as $HOME/.local/state/nvim-multi-bak$$"
  mv $HOME/.local/state/nvim-multi $HOME/.local/state/nvim-multi-bak$$
}

printf "\nCloning nvim-multi configuration into $HOME/.config/nvim-multi ... "
git clone \
  https://github.com/doctorfree/nvim-multi $HOME/.config/nvim-multi > /dev/null 2>&1
printf "done"
export NVIM_APPNAME="nvim-multi"
printf "\nInitializing newly installed neovim configuration ... "
$HOME/.config/nvim-multi/lazy.sh install > /dev/null 2>&1
printf "done\n"
nvim
printf "\nAdd the following line to your .bashrc or .zshrc shell initialization:"
printf '\n\texport NVIM_APPNAME="nvim-multi"\n'
