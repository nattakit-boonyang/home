_G.servers = {
  lsp = {
    "bashls",
    "jsonls",
    "lua_ls",
    "yamlls",
    "marksman",
    "gopls",
    "emmet_ls",
    "html",
    "tsserver",
    "cssls",
  },
  null_ls = {
    "shfmt",
    "hadolint",
    "yamllint",
    "stylua",
    "markdownlint",
    "gomodifytags",
    "impl",
    "gofumpt",
    "goimports_reviser",
    "revive",
  },
  sources_null_ls = function()
    local builtins = require("null-ls").builtins
    return {
      builtins.formatting.shfmt,
      builtins.diagnostics.hadolint,
      builtins.diagnostics.yamllint,
      builtins.formatting.stylua,
      builtins.formatting.markdownlint,
      builtins.code_actions.gomodifytags,
      builtins.code_actions.impl,
      builtins.formatting.gofumpt,
      builtins.formatting.goimports_reviser,
      builtins.diagnostics.revive,
    }
  end,
}
