local M = {}

function M.has(buffer, method)
	method = method:find("/") and method or "textDocument/" .. method
	local clients = vim.lsp.get_active_clients({ bufnr = buffer })
	for _, client in ipairs(clients) do
		if client.supports_method(method) then
			return true
		end
	end
	return false
end

return M
