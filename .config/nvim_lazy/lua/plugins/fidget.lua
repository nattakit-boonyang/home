return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  dependencies = "lsp-zero",
  event = "LspAttach",
  opts = {
    lsp_status = true,
  },
  config = true,
}
