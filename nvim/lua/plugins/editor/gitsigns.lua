-- Plugin: https://github.com/lewis6991/gitsigns.nvim
return {
  plugins.editor.repo_gitsigns,
  name = plugins.editor.gitsigns,
  event = { "BufReadPre", "BufNewFile" },
  config = true,
  opts = {
    signs = icons.gitsigns,
    current_line_blame = true,
    current_line_blame_formatter = "<author>, <author_time:%c> - <summary>",
    signcolumn = true,
  },
}
