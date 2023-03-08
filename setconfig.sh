#!/bin/bash
#
# setconfig.sh - switch configuration.lua 'config' setting
#
# config entries in configuration.lua look like this:
# M.config = "doctorfree"
# -- M.config = "lazyvim"
# -- M.config = "tvl"
# call this script from a dashboard button entry or keymap
# to easily switch between neovim configurations
#
# usage: setconfig.sh <configuration>
# where <configuration> is a subdirectory in ~/.config/nvim/lua/

new="$1"
[ "${new}" ] || exit 0

luadir=${HOME}/.config/nvim/lua
[ -d ${luadir}/${new} ] || exit 0

configfile=${luadir}/configuration.lua
[ -f ${configfile} ] || exit 0

old=$(grep ^M.config ${configfile} | awk -F '"' ' { print $2 } ')
[ "${old}" ] || exit 0

[ "${new}" == "${old}" ] && exit 0

cat ${configfile} | sed -e "s/^M.config.*/M.config = \"${new}\"/" > /tmp/nvim$$
cp /tmp/nvim$$ ${configfile}
rm -f /tmp/nvim$$
