-- Plugin: https://github.com/echasnovski/mini.comment
return {
  plugins.editor.mini.repo_mini_comment,
  name = plugins.editor.mini.mini_comment,
  config = function(_, opts)
    require("mini.comment").setup(opts)
  end,
}
