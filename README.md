## Neovim multi lazy config

![nvim-1](https://user-images.githubusercontent.com/80513079/216895409-4d7b246c-d7da-4f9e-8680-8f6b60ffa201.png)

Forked from https://github.com/loctvl842/nvim with the intent to extend this
Lazy Neovim configuration to support multiple configs selectable via settings
or dashboard. A work in progress.

To configure this Neovim configuration repository, edit `lua/configuration.lua`
and set `M.config` to one of `tvl`, `LazyVim`, or `doctorfree`.

### Original `tvl` configuration

Setting `M.config` in `configuration.lua` to `tvl` will configure according to the
original fork of the upstream repository and use the setup in `lua/tvl`. These
files remain unchanged and do not use any of the settings in `configuration.lua`

### LazyVim configuration

Similarly, setting `M.config` in `configuration.lua` to `LazyVim` will configure
Neovim using a modified starter template from the
[LazyVim repository](https://github.com/LazyVim/LazyVim). This also ignores the
other settings in `configuration.lua`. See https://www.lazyvim.org/ for
documentation on customizing LazyVim. The default LazyVim configuration has been
modified to integrate into the multi-config setup found here.

### My `doctorfree` configuration

Setting `M.config` to `doctorfree` will use the config files in `lua/doctorfree`
which use the other settings in `configuration.lua`, load a different set of
plugins, use a different dashboard by default, and provide different customizations.

### Switching Neovim configuration

Currently you can switch between these three configurations only by editing the
`lua/configuration.lua` file and restarting Neovim.

### Adding a custom Neovim configuration

To add another custom Neovim configuration, create a subdirectory under
`~/.config/nvim/lua` with the Neovim configuration files you wish to use.
Below the `<custom>` directory refers to this new subdir in `nvim/lua`.
Place the lazy plugin specs you wish to use in the `lua/<custom>/plugins/`
and plugin configuration files in `lua/<custom>/config`.

There must be one of `~/.config/nvim/lua/<custom>/config/lazy.lua`
or `~/.config/nvim/lua/<custom>/core/lazy.lua` to specify your lazy startup.

Once the new custom Neovim configuration files are in place, edit the
`~/.config/nvim/lua/configuration.lua` file and set `M.config = "<custom>"`
where `<custom>` is the name of the newly created `nvim/lua/` subdirectory.
