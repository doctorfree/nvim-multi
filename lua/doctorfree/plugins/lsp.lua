return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
      { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "W", "<cmd>lua vim.lsp.buf.format()<CR><cmd>w!<CR>", desc = "Format and Save" },
    },
    config = function()
      -- special attach lsp
      require("utils.utils").on_attach(function(client, buffer)
        require("doctorfree.config.lsp.keymaps").on_attach(client, buffer)
        require("doctorfree.config.lsp.inlayhints").on_attach(client, buffer)
        require("doctorfree.config.lsp.gitsigns").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("doctorfree.core.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(require("doctorfree.config.lsp.diagnostics")["on"])

      -- Show line diagnostics automatically in hover window
      vim.cmd([[
        autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
      ]])

      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation
      local diagnostics_active = true
      local toggle_diagnostics = function()
        diagnostics_active = not diagnostics_active
        if diagnostics_active then
          vim.diagnostic.show()
        else
          vim.diagnostic.hide()
        end
      end

      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)
      vim.keymap.set('n', '<leader>dt', toggle_diagnostics)

      local servers = require("doctorfree.config.lsp.servers")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      local mason_lspconfig = require("mason-lspconfig")
      local available = mason_lspconfig.get_available_servers()

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    -- opts = {
    --   ui = {
    --     -- border = "rounded",
    --     border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
    --     icons = {
    --       package_installed = "◍",
    --       package_pending = "◍",
    --       package_uninstalled = "◍",
    --     },
    --   },
    --   log_level = vim.log.levels.INFO,
    --   max_concurrent_installers = 4,
    -- },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      -- print(vim.inspect(formatting.sql_formatter))
      -- print(vim.inspect(formatting.black))
      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier,
          formatting.stylua,
          formatting.google_java_format,
          formatting.black.with({ extra_args = { "--fast" } }),
          formatting.sql_formatter.with({ extra_args = { "--config" } }),
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "google_java_format",
        "black",
        "sql_formatter",
      },
      automatic_setup = true,
    },
  },

  "mfussenegger/nvim-jdtls",
}
