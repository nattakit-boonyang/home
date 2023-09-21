return {
  plugins.editor.mini.repo_mini_indentscope,
  name = plugins.editor.mini.mini_indentscope,
  event = "VeryLazy",
  config = function(_, opts)
    require('mini.indentscope').gen_animation.none()
    require("mini.indentscope").setup(opts)
  end,
  opts = {
    symbol = "│",
    n_lines = 50,
    draw = { animation = nil },
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
