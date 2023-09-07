-- Plugin: https://github.com/nvim-telescope/telescope.nvim
return new_plugin(plugins.editor.telescope).load_when_called("Telescope").set_options({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
  },
})
