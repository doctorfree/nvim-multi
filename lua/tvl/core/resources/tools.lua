return {
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function() require("tvl.config.comment") end,
  },

  {
    "kevinhwang91/rnvimr",
    init = function() require("tvl.config.ranger") end,
  },

  "mg979/vim-visual-multi",

  {
    "loctvl842/compile-nvim",
    lazy = true,
    config = function() require("tvl.config.compile") end,
  },

  {
    "filipdutescu/renamer.nvim",
    lazy = true,
    branch = "master",
    config = function() require("tvl.config.renamer") end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "dark" },
  },

  "moll/vim-bbye",

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    keys = {
      {
        "<leader>qs",
        function() require("persistence").load() end,
        desc = "Restore Session",
      },
      {
        "<leader>ql",
        function() require("persistence").load({ last = true }) end,
        desc = "Restore Last Session",
      },
      {
        "<leader>qd",
        function() require("persistence").stop() end,
        desc = "Don't Save Current Session",
      },
    },
  },
}