-- Currently supported themes:
--   nightfox, tundra, tokyonight, catppuccin, kanagawa, monokai-pro, onedarkpro
--

local settings = require("configuration")

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.nightfox")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.onedarkpro")
    end,
  },
  {
    "sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.tundra")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    branch = "main",
    config = function()
      require(settings.config .. ".themes.tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.kanagawa")
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.monokai-pro")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require(settings.config .. ".themes.catppuccin")
    end,
  }
}
