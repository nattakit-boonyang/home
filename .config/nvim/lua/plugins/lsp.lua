return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
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
    },
  },
  {
    -- https://github.com/neovim/nvim-lspconfig
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
}
