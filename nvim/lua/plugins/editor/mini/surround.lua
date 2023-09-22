-- Plugin: https://github.com/echasnovski/mini.surround
return {
  plugins.editor.mini.repo_mini_surround,
  name = plugins.editor.mini.mini_surround,
  config = function(_, opts) require("mini.surround").setup(opts) end,
  opts = {
    n_lines = 50,
    mappings = {
      add = "gza",            -- Add surrounding in Normal and Visual modes
      delete = "gzd",         -- Delete surrounding
      find = "gzf",           -- Find surrounding (to the right)
      find_left = "gzF",      -- Find surrounding (to the left)
      highlight = "gzh",      -- Highlight surrounding
      replace = "gzr",        -- Replace surrounding
      update_n_lines = "gzn", -- Update `n_lines`
    },
  },
}
