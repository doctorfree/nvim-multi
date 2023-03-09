## Neovim multi lazy config

![nvim-1](https://user-images.githubusercontent.com/80513079/216895409-4d7b246c-d7da-4f9e-8680-8f6b60ffa201.png)

This Neovim configuration repository intends to provide several pre-configured
Neovim configurations using Lua, Lazy, and Mason and a simple way to switch
between them - either via the dashboard, settings, or a key binding.

### Installation

Neovim 0.9 and later users can use the `NVIM_APPNAME` environment variable
to control where Neovim looks for its configuration. See the
[NVIM_APPNAME](#nvim_appname) section below for installation and
initialization of `nvim-multi` using `NVIM_APPNAME`.

Users of Neovim 0.8 and earlier can install and initialize `nvim-multi`
following these instructions:

- Backup any existing Neovim configuration, state, and installed plugins

```bash
[ -d $HOME/.config/nvim ] && {
  echo "Backing up Neovim config as $HOME/.config/nvim-bak$$"
  mv $HOME/.config/nvim $HOME/.config/nvim-bak$$
}
[ -d $HOME/.local/state/nvim ] && {
  echo "Backing up Neovim state as $HOME/.local/state/nvim-bak$$"
  mv $HOME/.local/state/nvim $HOME/.local/state/nvim-bak$$
}
[ -d $HOME/.local/share/nvim ] && {
  echo "Backing up Neovim installed plugins as $HOME/.local/share/nvim-bak$$"
  mv $HOME/.local/share/nvim $HOME/.local/share/nvim-bak$$
}
```

- Clone the `nvim-multi` Neovim configuration repository and initialize Neovim

```bash
git clone https://github.com/doctorfree/nvim-multi $HOME/.config/nvim
$HOME/.config/nvim/lazy.sh install
nvim
```

Mason will install several packages required by the new Neovim configuration.

After installing and initializing the Neovim configuration, perform a health
check while in Neovim with `:checkhealth`. Examine any warnings or errors and
perform any necessary remedial actions such as installing missing packages
or resolving keymap conflicts.

#### NVIM_APPNAME

In Neovim 0.9 and later there is a new feature enabling control of the
Neovim configuration location through the `NVIM_APPNAME` environment
variable. For example, `export NVIM_APPNAME="nvim-multi"` in your shell
would make `nvim` look for its configuration in `~/.config/nvim-multi`
rather than `~/.config/nvim`. This new feature can be used to easily
switch between Neovim configurations.

If you wish to use this repository in conjunction with a setup utilizing the
`NVIM_APPNAME` feature then the installation process described above might
better be performed with something like the following:

- Backup any pre-existing `nvim-multi` config folder

```bash
[ -d $HOME/.config/nvim-multi ] && {
  echo "Backing up existing nvim-multi config as $HOME/.config/nvim-multi-bak$$"
  mv $HOME/.config/nvim-multi $HOME/.config/nvim-multi-bak$$
}
```

- Clone the `nvim-multi` Neovim configuration repository and initialize Neovim

```bash
echo "Cloning nvim-multi configuration into $HOME/.config/nvim-multi"
git clone https://github.com/doctorfree/nvim-multi $HOME/.config/nvim-multi
export NVIM_APPNAME="nvim-multi"
$HOME/.config/nvim-multi/lazy.sh install
nvim
```

This procedure allows you to keep any existing `~/.config/nvim` and install
multiple Neovim configurations, each in its own separate
`~/.config/$NVIM_APPNAME` folder.

**[Important Not:]** If `nvim-multi` is installed and initialized using the
`NVIM_APPNAME` environment variable as described in this section then it is
important to add the setting and export of this variable to your shell's
initialization file (e.g. `.bashrc` for Bash users, `.zshrc` for Zsh users).
Add the line `export NVIM_APPNAME="nvim-multi"` to your shell initialization
and re-login or source the initialization file. If this is not done then
subsequent invocations of `nvim` will attempt to use `~/.config/nvim` rather
than `~/.config/nvim-multi`.

### Selecting which of the `nvim-multi` configurations to use

To select a Neovim configuration, edit `lua/configuration.lua`
and set `M.config` to one of `tvl`, `lazyvim`, or `doctorfree`.

#### Original `tvl` configuration

Setting `M.config` in `configuration.lua` to `tvl` will configure according to the
original fork of the upstream repository and use the setup in `lua/tvl`. These
files remain unchanged and do not use any of the settings in `configuration.lua`

#### LazyVim configuration

Similarly, setting `M.config` in `configuration.lua` to `lazyvim` will configure
Neovim using a modified starter template from the
[LazyVim repository](https://github.com/LazyVim/LazyVim). This also ignores the
other settings in `configuration.lua`. See https://www.lazyvim.org/ for
documentation on customizing LazyVim. The default LazyVim configuration has been
modified to integrate into the multi-config setup found here.

#### My `doctorfree` configuration

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
