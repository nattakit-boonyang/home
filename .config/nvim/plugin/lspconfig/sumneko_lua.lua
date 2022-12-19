return {
	Lua = {
		format = {
			enable = true,
		},
		runtime = {
			version = 'LuaJIT',
		},
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = {
				vim.api.nvim_get_runtime_file('', true),
			vim.fn.expand('$VIMRUNTIME/lua'),
				vim.fn.stdpath('config'),
			},
			maxPreload = 2000,
			preloadFileSize = 50000,
		},
		telemetry = {
			enable = false,
		},
	},
}
