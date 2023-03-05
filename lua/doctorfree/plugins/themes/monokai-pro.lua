local settings = require("configuration")

require("monokai-pro").setup({
  transparent_background = settings.enable_transparent,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  italic_comments = true,
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  -- Enable this will disable filter option
  day_night = {
    enable = false, -- turn off by default
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer"
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
  plugins = {
    bufferline = {
      underline_selected = true,
      underline_visible = true,
      bold = false,
    },
    indent_blankline = {
      context_highlight = "pro", -- default | pro
      context_start_underline = true,
    },
  },
  override = function(c)
    local float = lualine_config.float
    local colorful = lualine_config.colorful
    local float_background = c.editorSuggestWidget.background
    local alt_float_background = c.editor.background
    local statusbar_bg = c.statusBar.background
    return {
      ColorColumn = { bg = c.base.dimmed3 },
      -- Mine
      DashboardRecent = { fg = c.base.magenta },
      DashboardProject = { fg = c.base.blue },
      DashboardConfiguration = { fg = c.base.white },
      DashboardSession = { fg = c.base.green },
      DashboardLazy = { fg = c.base.cyan },
      DashboardServer = { fg = c.base.yellow },
      DashboardQuit = { fg = c.base.red },
      SLDiffAdd = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.gitDecoration.addedResourceForeground or c.statusBar.foreground,
      },
      SLDiffChange = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.gitDecoration.modifiedResourceForeground or c.statusBar.foreground,
      },
      SLDiffDelete = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.gitDecoration.deletedResourceForeground or c.statusBar.foreground,
      },
      SLGitIcon = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.yellow or c.statusBar.foreground,
      },
      SLBranchName = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.white or c.statusBar.foreground,
      },
      SLError = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.inputValidation.errorForeground or c.statusBar.foreground,
      },
      SLWarning = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.inputValidation.warningForeground or c.statusBar.foreground,
      },
      SLInfo = {
        bg = float and alt_float_background or statusbar_bg,
        fg = colorful and c.inputValidation.infoForeground or c.statusBar.foreground,
      },
      SLPosition = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.magenta or c.statusBar.foreground,
      },
      SLShiftWidth = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.yellow or c.statusBar.foreground,
      },
      SLEncoding = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.green or c.statusBar.foreground,
      },
      SLFiletype = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.cyan or c.statusBar.foreground,
      },
      SLMode = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.base.green or c.statusBar.foreground,
        bold = true,
      },
      SLSeparatorUnused = {
        bg = float and float_background or statusbar_bg,
        fg = colorful and c.editor.background or c.statusBar.foreground,
      },
      SLSeparator = {
        bg = float and c.editor.background or statusbar_bg,
        fg = float and float_background or statusbar_bg,
      },
      SLPadding = {
        bg = float and c.editor.background or statusbar_bg,
        fg = c.editor.background,
      },
    }
  end,
})
vim.cmd("colorscheme monokai-pro")
