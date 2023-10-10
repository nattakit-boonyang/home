-- Plugin: https://github.com/folke/flash.nvim
return {
  plugins.editor.repo_flash,
  name = plugins.editor.flash,
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,       desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
}
