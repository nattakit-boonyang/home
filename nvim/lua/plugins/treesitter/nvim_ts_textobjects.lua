-- Plugin: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
return new_plugin(plugins.treesitter.nvim_ts_textobjects).load_after(plugins.treesitter.nvim_ts).load_when_used()
