local settings = require("configuration")

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = settings.enable_transparent,
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = {
    "qf",
    "help",
    "vista_kind",
    "terminal",
    "spectre_panel",
    "startuptime",
    "Outline",
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function(highlights, colors) end,
})

if settings.theme == "tokyonight" then
  vim.cmd([[colorscheme tokyonight]])
  vim.api.nvim_set_hl(0, "MiniJump", { fg = "#FFFFFF", bg = "#ff00a0" })
  if settings.enable_neotree then
    local colors = require('tokyonight.colors').setup()
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.fg, bold = true })
    vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = colors.fg })
    vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = colors.green })
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.blue_3 })
    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.green })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.orange })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.blue_2 })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = colors.blue_2 })
    vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = colors.cyan })
  end
end
