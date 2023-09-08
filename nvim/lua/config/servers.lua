_G.servers = {
  lsp = {
    "bashls",
    "jsonls",
    "lua_ls",
    "yamlls",
    "marksman",
  },
  null_ls = {
    "hadolint",
    "yamllint",
    "stylua",
    "markdownlint",
  },
  null_ls_sources = function()
    local builtins = require("null-ls").builtins

    return {
      builtins.diagnostics.hadolint,
      builtins.diagnostics.yamllint,
      builtins.formatting.stylua,
      builtins.formatting.markdownlint,
    }
  end,
}
