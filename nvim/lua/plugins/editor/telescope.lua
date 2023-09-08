-- Plugin: https://github.com/nvim-telescope/telescope.nvim
return new_plugin(plugins.editor.telescope)
    .load_after(plugins.util.plenary)
    .load_when_called("Telescope")
    .set_options({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
    })
    .load_when_pressed({
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    })
    .load_when_pressed({
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep",
    })
    .load_when_pressed({
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Old Files",
    })
