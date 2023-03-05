local settings = require("configuration")

require("tokyonight").setup({
  -- night, storm, day, moon
  style = "night",
  transparent = settings.enable_transparent,
  -- styles = {
  --   sidebars = "transparent",
  --   floats = "transparent",
  -- },
  sidebars = {
    "qf",
    "vista_kind",
    "terminal",
    "spectre_panel",
    "startuptime",
    "Outline",
  },
  -- borderless Telescope
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
  --    on_highlights = function(hl, c)
  --      hl.CursorLineNr = { fg = c.orange, bold = true }
  --      hl.LineNr = { fg = c.orange, bold = true }
  --      hl.LineNrAbove = { fg = c.fg_gutter }
  --      hl.LineNrBelow = { fg = c.fg_gutter }
  --      local prompt = "#2d3149"
  --      hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  --      hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  --      hl.TelescopePromptNormal = { bg = prompt }
  --      hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  --      hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
  --      hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --      hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --    end,
})

vim.cmd([[colorscheme tokyonight]])
vim.api.nvim_set_hl(0, "MiniJump", { fg = "#FFFFFF", bg = "#ff00a0" })
