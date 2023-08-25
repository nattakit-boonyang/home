-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = 'all',
      autotag = {
        enable = true,
      },
      playground = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
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
      textobjects = {
        enable = true,
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
            [']p'] = '@parameter.inner',
            [']l'] = '@loop.outer',
            [']o'] = '@conditional.outer',
          },
          goto_next_end = {
            [']m'] = '@function.outer',
            [']['] = '@class.outer',
            [']p'] = '@parameter.inner',
            [']l'] = '@loop.outer',
            [']o'] = '@conditional.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
            ['[p'] = '@parameter.inner',
            ['[l'] = '@loop.outer',
            ['[o'] = '@conditional.outer',
          },
          goto_previous_end = {
            ['[m'] = '@function.outer',
            ['[]'] = '@class.outer',
            ['[p'] = '@parameter.inner',
            ['[l'] = '@loop.outer',
            ['[o'] = '@conditional.outer',
          },
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
          },
        },
      },
    })
  end,
}
