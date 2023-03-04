local settings = require("settings")

if settings.theme == "nightfox" then
  return {
    "EdenEast/nightfox.nvim",
    config = function()
      require("doctorfree.plugins.themes.nightfox")
    end,
  }
elseif settings.theme == "tundra" then
  return {
    "sam4llis/nvim-tundra",
    config = function()
      require("doctorfree.plugins.themes.tundra")
    end,
  }
elseif settings.theme == "tokyonight" then
  return {
    "folke/tokyonight.nvim",
    branch = "main",
    config = function()
      require("doctorfree.plugins.themes.tokyonight")
    end,
  }
elseif settings.theme == "kanagawa" then
  return {
    "rebelot/kanagawa.nvim",
    config = function()
      require("lua.doctorfree.plugins.themes.kanagawa")
    end,
  }
elseif settings.theme == "monokai-pro" then
  return {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("lua.doctorfree.plugins.themes.monokai-pro")
    end,
  }
else
  return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("doctorfree.plugins.themes.catppuccin")
    end,
  }
end
