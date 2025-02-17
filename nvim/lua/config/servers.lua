local base_lsp = {
  "bashls",
  "jsonls",
  "lua_ls",
  "yamlls",
  "marksman",
  "gopls",
  "emmet_ls",
  "html",
  "ts_ls",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
}

local lsp = { "buf_ls" }
local mason_lsp = { "buf_ls" }

table.move(base_lsp, 1, #base_lsp, 2, lsp)
table.move(base_lsp, 1, #base_lsp, 2, mason_lsp)

_G.servers = {
  lsp = lsp,
  mason_lsp = mason_lsp,
  null_ls = {
    "fish_indent",
    "fish",
    "checkmake",
    "hadolint",
    "yamllint",
    "revive",
    "shfmt",
    "stylua",
    "markdownlint",
    "gofumpt",
    "goimports",
    "buf",
    "golines",
    "gomodifytags",
    "impl",
    "prettier",
    "codespell",
    "spell",
  },
  sources_null_ls = function()
    local builtins = require("null-ls").builtins
    return {
      builtins.diagnostics.fish,
      builtins.diagnostics.checkmake,
      builtins.diagnostics.hadolint,
      builtins.diagnostics.yamllint,
      builtins.diagnostics.revive,
      builtins.diagnostics.buf,
      builtins.code_actions.gomodifytags,
      builtins.code_actions.impl,
      builtins.formatting.fish_indent,
      builtins.formatting.shfmt,
      builtins.formatting.stylua,
      builtins.formatting.markdownlint,
      builtins.formatting.gofumpt,
      builtins.formatting.goimports,
      builtins.formatting.buf,
      builtins.formatting.prettier,
      builtins.diagnostics.codespell,
      builtins.completion.spell,
      builtins.formatting.golines.with({
        extra_args = {
          "--max-len=180",
          "--base-formatter=gofumpt",
        },
      }),
    }
  end,
  dap = { "delve" },
}
