-- Plugin: https://github.com/leoluz/nvim-dap-go
return {
  plugins.dap.repo_dap_go,
  name = plugins.dap.dap_go,
  dependencies = {
    plugins.dap.dap,
    plugins.dap.dap_ui,
  },
  config = true,
}
