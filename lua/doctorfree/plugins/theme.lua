-- Currently supported themes:
--   nightfox, tundra, tokyonight, catppuccin, kanagawa, monokai-pro

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("doctorfree.themes.nightfox")
    end,
  },
  {
    "sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("doctorfree.themes.tundra")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    branch = "main",
    config = function()
      require("doctorfree.themes.tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("doctorfree.themes.kanagawa")
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("doctorfree.themes.monokai-pro")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("doctorfree.themes.catppuccin")
    end,
  }
}
