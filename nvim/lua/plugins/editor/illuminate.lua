-- Plugin: https://github.com/RRethy/vim-illuminate
return {
  plugins.editor.repo_illuminate,
  name = plugins.editor.illuminate,
  event = { "BufReadPost", "BufNewFile" },
  -- stylua: ignore
  keys = {
    { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference" },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
