local tree = require('nvim-tree')

local ignore_dirs = {
  '^\\.git',
  '^\\.idea',
  '^\\.vscode',
  '^\\.DS_Store',
  '^\\node_modules',
}

tree.setup({
  diagnostics = {
    enable = true,
  },
  git = {
    ignore = false,
  },
  filesystem_watchers = {
    ignore_dirs = ignore_dirs,
  },
  filters = {
    custom = ignore_dirs,
    exclude = { },
  },
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    width = 25,
    hide_root_folder = true,
  },
  renderer = {
    highlight_opened_files = 'name',
  },
})
