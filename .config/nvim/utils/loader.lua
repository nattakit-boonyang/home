local M = {}

local empty_module = {
	setup = function(cfg) end
}

function M.load_plugin(name)
	local status, plugin = pcall(require, name)
	if not status then
		g.notify.error(string.format('plugin %s not loaded', name))

		return empty_module
	end
	return plugin
end

function M.load_file(path, name)
	local full_path = string.format('%s/%s', vim.fn.stdpath('config'), path)
	local filename = string.format('%s/%s.lua', full_path, name)
	local status, _ = pcall(vim.cmd, string.format('source %s', filename))
	if not status then
		g.notify.error(string.format('%s config %s not loaded', path, name))
	end
end

function M.load_lspconfig_setup(name)
	local package_name = string.format('plugin.lspconfig.%s', name)
	local status, config = pcall(require, package_name)
	if not status then return {} end
	return config
end

return M
