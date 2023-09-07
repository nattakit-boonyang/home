-- https://github.com/nvim-treesitter/playground
return new_plugin(plugins.treesitter.nvim_ts_playground).load_after(plugins.treesitter.nvim_ts).load_when_used()
