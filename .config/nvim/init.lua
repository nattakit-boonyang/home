-- add config files here
local conf_files = {
	core = {
		'globals', -- Some global settings
		'options', -- Setting options in nvim
		'autocommands', -- Various autocommands
		'keymaps', -- All the key mappings
		'plugins', -- All the plugins installed and their configurations
		'colorschemes', -- Colorscheme settings
	},
}

-- Override lua package path
package.path = string.format('%s;%s/?.lua', package.path, vim.fn.stdpath('config'))

-- Ensure to initial global utilities
g = {
	notify = require('utils.notify'), -- Print log
	buffer = require('utils.buffer'), -- Buffer handler
	loader = require('utils.loader'), -- Package loader
}

for path, files in pairs(conf_files) do
	for _, file in ipairs(files) do
		-- Handle whitespace in package name
		file = string.gsub(file, '%s+', '')
		g.loader.load_file(path, file)
	end
end
