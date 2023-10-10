-- Plugin: https://github.com/ray-x/go.nvim
return {
  plugins.lsp.repo_go,
  name = plugins.lsp.go,
  dependencies = {
    {
      -- Plugin: https://github.com/ray-x/guihua.lua
      plugins.ui.repo_guihua,
      name = plugins.ui.guihua,
      lazy = true,
    },
    plugins.coding.treesitter,
    plugins.lsp.lspconfig,
  },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  opts = {
    lsp_keymaps = false,
    verbose = false,
    textobjects = false,
    run_in_floaterm = true,
    floaterm = {
      posititon = "center",
    },
    diagnostic = {
      underline = false,
    },
  },
  config = function(_, opts)
    local opt = { noremap = true, silent = true }
    local go = require("go")
    go.setup(opts)

    opt.desc = " GoTest"
    vim.keymap.set("n", "<leader>kt", "<cmd>GoTest<cr>", opt)
    opt.desc = " GoFillStruct"
    vim.keymap.set("n", "<leader>ks", "<cmd>GoFillStruct<cr>", opt)
    opt.desc = " GoRun"
    vim.keymap.set("n", "<leader>kr", "<cmd>GoRun<cr>", opt)
    opt.desc = " GoCodeLenAct"
    vim.keymap.set("n", "<leader>kc", "<cmd>GoCodeLenAct<cr>", opt)
  end,
}
