-- Plugin: https://github.com/echasnovski/mini.surround
return {
  plugins.editor.mini.repo_mini_surround,
  name = plugins.editor.mini.mini_surround,
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
  opts = {
    n_lines = 50,
    mappings = {
      add = "gza",
      delete = "gzd",
      find = "gzf",
      find_left = "gzF",
      highlight = "gzh",
      replace = "gzr",
      update_n_lines = "gzn",
    },
  },
}
