-- https://github.com/windwp/nvim-ts-autotag
return new_plugin(plugins.treesitter.nvim_ts_autotag).load_after(plugins.treesitter.nvim_ts).load_when_used()
