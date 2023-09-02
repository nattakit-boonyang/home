return {
  -- https://github.com/williamboman/mason-lspconfig.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pylsp",
        "pyright",
        "cmake",
        "clangd",
        "lemminx",
        "rust_analyzer",
        "gopls",
        "bashls",
        "marksman",
        "tsserver",
        "rust_analyzer",
        "cssls",
        "jsonls",
        "eslint",
        "html",
        "yamlls",
        "emmet_ls",
        "lua_ls",
        "dockerls",
      },
      automatic_installation = true,
    },
  },

  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        lua_ls = {
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
          },
        },
      },
    },
  },

  -- https://github.com/ray-x/go.nvim
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "InsertEnter",
    ft = { "go", "gomod" },
    build = function()
      require("go.install").update_all_sync()
    end,
    config = true,
  },
}
