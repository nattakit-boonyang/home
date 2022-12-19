-- Set dracula theme
local status, _ = pcall(vim.cmd, [[colorscheme dracula]])
if not status then
	notify.error('colorscheme dracula not set')
end
