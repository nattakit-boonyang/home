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
    "shfmt",
    "hadolint",
    "yamllint",
    "stylua",
    "markdownlint",
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
      builtins.diagnostics.revive,
    }
  end,
}
