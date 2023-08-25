-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
  "VonHeikemen/lsp-zero.nvim",
  event = { "BufEnter", "BufWinEnter" },
  name = "lsp-zero",
  branch = "v2.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lua" },
    -- https://github.com/zbirenbaum/copilot-cmp
    {
      "zbirenbaum/copilot-cmp",
      config = true,
    },
  },
  config = function()
    local lspzero = require("lsp-zero").preset("recommended")
    local lspconfig = require("lspconfig")

    lspzero.ensure_installed({
      "gopls",
      "bashls",
      "marksman",
      "tsserver",
      "rust_analyzer",
      "cssls",
      "dockerls",
      "jsonls",
      "eslint",
      "html",
      "lua_ls",
      "yamlls",
      "emmet_ls",
    })

    lspzero.set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = "»"
    })

    lspzero.nvim_workspace({
      library = vim.api.nvim_get_runtime_file("", true)
    })

    lspzero.on_attach(function(_, bufnr)
      lspzero.default_keymaps({ buffer = bufnr })
      lspzero.buffer_autoformat()
    end)

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          format = {
            enable = true,
          },
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              vim.api.nvim_get_runtime_file("", true),
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.expand("$MYVIMRC"),
              vim.fn.stdpath("config"),
              vim.fn.stdpath("config") .. "/lua",
            },
            maxPreload = 2000,
            preloadFileSize = 50000,
          },
          telemetry = { enable = false },
        },
      }
    })

    lspzero.setup()
  end,
}
