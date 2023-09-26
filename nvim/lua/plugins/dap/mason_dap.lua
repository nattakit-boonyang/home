-- Plugin: https://github.com/jay-babu/mason-nvim-dap.nvim
return {
  plugins.dap.repo_mason_dap,
  name = plugins.dap.mason_dap,
  dependencies = plugins.lsp.mason,
  cmd = { "DapInstall", "DapUninstall" },
  config = true,
  opts = {
    ensure_installed = servers.dap,
    automatic_installation = true,
  },
}
