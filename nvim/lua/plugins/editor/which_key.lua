-- Plugin: https://github.com/folke/which-key.nvim
return {
  plugins.editor.repo_which_key,
  name = plugins.editor.which_key,
  event = "VeryLazy",
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      mode = { "n", "v" },
      g = { name = "󰷕 Goto" },
      gz = { name = "󰅪 Surround" },
      ["["] = { name = " Prev" },
      ["]"] = { name = " Next" },
      ["<leader>f"] = { name = "󰮗 Find" },
      ["<leader>b"] = { name = " Buffer" },
      ["<leader>o"] = { name = " Dismiss" },
      ["<leader>c"] = { name = "󰨽 Code" },
      ["<leader>s"] = { name = " Search" },
      ["<leader>x"] = { name = "󰍉 Trouble" },
    })
  end,
}
