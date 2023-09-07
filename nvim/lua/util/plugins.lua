_G.new_plugin = function(name)
	local M = {
		name,
		version = false,
	}

	function M.load_after(dependency)
		M.dependencies = M.dependencies or {}
		table.insert(M.dependencies, dependency)
		return M
	end

	function M.set_options(opts)
		if type(opts) == "function" then
			M.opts = opts
		elseif type(opts) == "table" then
			M.opts = vim.tbl_extend("force", M.opts or {}, opts or {})
		end
		return M
	end

	function M.setup(config)
		if type(config) == "function" then
			M.config = config
		elseif type(config) == "table" then
			M.config = vim.tbl_extend("force", M.config or {}, config or {})
		end
		return M
	end

	function M.no_options()
		M.opts = {}
		return M
	end

	function M.no_setup()
		M.config = true
		return M
	end

	function M.is_lazy()
		M.event = "VeryLazy"
		return M
	end

	function M.load_when_used()
		M.lazy = true
		return M
	end

	function M.load_when_called(cmd)
		M.cmd = M.cmd or {}
		table.insert(M.cmd, cmd)
		return M
	end

	function M.load_when_pressed(key)
		M.keys = M.keys or {}
		table.insert(M.keys, key)
		return M
	end

	function M.load_on_event(event)
		M.event = M.event or {}
		table.insert(M.event, event)
		return M
	end

	function M.is_filetype(ft)
		M.ft = M.ft or {}
		table.insert(M.ft, ft)
		return M
	end

	function M.override(opts)
		return vim.tbl_extend("force", M, opts or {})
	end

	function M.table()
		return M
	end

	return M
end
