-- Plugin for syntax
local treesitter = require('nvim-treesitter.configs')

local install_list
if not (vim.fn.has('mac') == 1) then
  install_list = {
    'bash', 'cmake', 'comment', 'cpp', 'css', 'diff', 'dockerfile', 'dot',
    'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'go', 'gomod', 'gowork',
    'graphql', 'help', 'html', 'http', 'java', 'javascript', 'jq', 'json', 'jsonc',
    'json5', 'jsonnet', 'lua', 'make', 'markdown', 'markdown_inline', 'php', 'phpdoc', 'proto',
    'python', 'regex', 'ruby', 'rust', 'scala', 'scss', 'sql', 'todotxt', 'tsx', 'typescript', 'yaml',
  }
else
  install_list = 'all'
end

treesitter.setup({
  ensure_installed = install_list,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  matchup = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  textobjects = {
    enable = true,
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer'
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer'
      }
    },
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['aa'] = '@call.outer',
        ['ia'] = '@call.inner',
        ['ao'] = '@conditional.outer',
        ['io'] = '@conditional.inner',
        ['am'] = '@comment.outer',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
        ['as'] = '@statement.outer',
      }
    },
  },
})
