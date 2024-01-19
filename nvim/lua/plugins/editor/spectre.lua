-- Plugin: https://github.com/nvim-pack/nvim-spectre
return {
  plugins.editor.repo_spectre,
  name = plugins.editor.spectre,
  dependencies = plugins.ui.plenary,
  config = true,
  keys = {
    -- { "<leader>S", mode = "n", function() require("spectre").toggle() end, desc = "Spectre Toggle" },
    {
      "<leader>S",
      mode = "n",
      function()
        require("spectre").toggle({
          is_insert_mode = true,
          is_close = false,
        })
      end,
      desc = "Spectre Toggle",
    },
  },
}
