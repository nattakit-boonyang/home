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
    "dockerls",
    "docker_compose_language_service",
  },
  null_ls = {
    "checkmake",
    "hadolint",
    "yamllint",
    "revive",
    "shfmt",
    "stylua",
    "markdownlint",
    "gofumpt",
    "golines",
    "goimports_reviser",
  },
  sources_null_ls = function()
    local builtins = require("null-ls").builtins
    return {
      builtins.diagnostics.checkmake,
      builtins.diagnostics.hadolint,
      builtins.diagnostics.yamllint,
      builtins.diagnostics.revive,
      builtins.formatting.shfmt,
      builtins.formatting.stylua,
      builtins.formatting.markdownlint,
      builtins.formatting.gofumpt,
      builtins.formatting.golines,
      builtins.formatting.goimports_reviser,
    }
  end,
  dap = { "delve" },
}
