local tree = require('neo-tree')

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

tree.setup({
  close_if_last_window = true,
  source_selector = {
    winbar = false,
    statusline = false,
  },
  window = {
    mappings = {
      ['o'] = 'open',
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = true,
      hide_gitignored = false,
      hide_hidden = true,
      hide_by_name = {
        'node_modules',
      },
      hide_by_pattern = {},
      always_show = {
        '.gitignore',
      },
      never_show = {
        '.DS_Store',
        'thumbs.db',
        '.git',
        '.idea',
        '.vscode',
      },
      never_show_by_pattern = {},
    },
  },
})
