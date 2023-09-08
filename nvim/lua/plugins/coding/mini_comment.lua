-- Plugin: https://github.com/echasnovski/mini.comment
return new_plugin(plugins.coding.mini_comment).is_lazy().set_options({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})
