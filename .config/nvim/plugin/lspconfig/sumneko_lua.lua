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
				vim.fn.stdpath('config') .. '/utils',
				vim.fn.stdpath('config') .. '/core',
				vim.fn.stdpath('config') .. '/plugin',
			},
			maxPreload = 2000,
			preloadFileSize = 50000,
		},
		telemetry = {
			enable = false,
		},
	},
}
