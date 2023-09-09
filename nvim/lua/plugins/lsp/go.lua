-- Plugin: https://github.com/ray-x/go.nvim
return new_plugin(plugins.lsp.go)
  .load_after(plugins.lsp.nvim_lspconfig)
  .load_after(plugins.treesitter.nvim_ts)
  .load_after(plugins.ui.guihua)
  .no_setup()
  .load_on_event("CmdlineEnter")
  .is_filetype("go")
  .is_filetype("gomod")
  .override({
    build = ':lua require("go.install").update_all_sync()',
  })
