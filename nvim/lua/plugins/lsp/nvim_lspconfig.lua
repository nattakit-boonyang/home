-- Plugin: https://github.com/neovim/nvim-lspconfig
return new_plugin(plugins.lsp.nvim_lspconfig)
	.load_after(plugins.lsp.cmp_nvim_lsp)
	.load_after(plugins.lsp.lua_neodev)
	.load_after(plugins.lsp.schema_store)
	.load_on_event("BufReadPre")
	.load_on_event("BufNewFile")
	.set_options({
		servers = {
			bashls = {
				filetypes = { "sh", "zsh" },
			},
			yamlls = {
				filetypes = { "yaml", "yaml.docker-compose", "sshconfig" },
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
				on_new_config = function(new_config)
					new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
					vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
				end,
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						keyOrdering = false,
						format = {
							enable = true,
						},
						validate = true,
						schemaStore = {
							enable = false,
							url = "",
						},
					},
				},
			},
			Lua = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			jsonls = {
				on_new_config = function(new_config)
					new_config.settings.json.schemas = new_config.settings.json.schemas or {}
					vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
				end,
				settings = {
					json = {
						format = {
							enable = true,
						},
						validate = { enable = true },
					},
				},
			},
		},
	})
	.setup(function()
		local lspconfig = require("lspconfig")
		local on_attach = function(_, bufnr)
			require("config.keymaps").set_lsp_keymaps(bufnr)
			if require("util.lsp").has(bufnr, "formatting") then
				require("config.autocmds").auto_format_on_save(bufnr)
			end
		end
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		for _, server in ipairs(servers.lsp) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
	end)
