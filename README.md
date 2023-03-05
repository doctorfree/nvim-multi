## Neovim multi lazy config

![nvim-1](https://user-images.githubusercontent.com/80513079/216895409-4d7b246c-d7da-4f9e-8680-8f6b60ffa201.png)

Forked from https://github.com/loctvl842/nvim with the intent to extend this
Lazy Neovim configuration to support multiple configs selectable via settings
or dashboard. A work in progress.

To configure this Neovim configuration repository, edit `lua/configuration.lua`
and set `M.config` to one of `tvl` or `doctorfree`.

Setting `M.config` in `configuration.lua` to `tvl` will configure according to the
original fork of the upstream repository and use the setup in `lua/tvl`. These
files remain unchanged and do not use any of the settings in `configuration.lua`

Setting `M.config` to `doctorfree` will use the config files in `lua/doctorfree`
which use the other settings in `configuration.lua`, load a different set of
plugins, use a different dashboard by default, and provide different customizations.

Currently you can switch between these two configurations only by editing the
`lua/configuration.lua` file and restarting Neovim.
