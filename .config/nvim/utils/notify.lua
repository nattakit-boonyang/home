local M = {}

local status, notify = pcall(require, 'notify')
if not status then
	-- fallback to vim notify
	notify = vim.notify
end

local opts = {
	title = 'nvim-config',
}

local debug_level = vim.log.levels.DEBUG
local error_level = vim.log.levels.ERROR
local info_level = vim.log.levels.INFO
local trace_level = vim.log.levels.TRACE
local warn_level = vim.log.levels.WARN
local off = vim.log.levels.OFF

function M.debug(msg) notify(msg, debug_level, opts) end
function M.error(msg) notify(msg, error_level, opts) end
function M.info(msg) notify(msg, info_level, opts) end
function M.trace(msg) notify(msg, trace_level, opts) end
function M.warn(msg) notify(msg, warn_level, opts) end
function M.print(msg) notify(msg, off, opts) end
function M.error_not_loaded(name) M.error(name) end

return M
