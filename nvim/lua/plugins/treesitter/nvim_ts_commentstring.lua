-- Plugin: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
return new_plugin(plugins.treesitter.nvim_ts_commentstring).load_after(plugins.treesitter.nvim_ts).load_when_used()
