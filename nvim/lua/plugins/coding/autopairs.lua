-- Plugin: https://github.com/windwp/nvim-autopairs
return {
  plugins.coding.repo_autopairs,
  name = plugins.coding.autopairs,
  dependencies = plugins.coding.treesitter,
  event = "InsertEnter",
  config = true,
  opts = {
    check_ts = true,
    disable_filetype = { "Trouble", "TelescopePrompt", "spectre_panel", "vim" },
  },
}
