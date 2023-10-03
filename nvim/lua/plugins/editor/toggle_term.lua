-- Plugin: https://github.com/akinsho/toggleterm.nvim
return {
  plugins.editor.repo_toggle_term,
  name = plugins.editor.toggle_term,
  config = true,
  opts = {
    direction = "float",
    float_opts = { border = "curved" },
  },
  keys = {
    { "<leader>t", "<cmd>TermSelect<cr>", desc = " Toggle Term" },
    {
      "<leader>g",
      function()
        local term = require("toggleterm.terminal").Terminal
        local lazygit = term:new({ cmd = "lazygit", hidden = true })
        lazygit:toggle()
      end,
      desc = " Lazygit",
    },
  },
}
