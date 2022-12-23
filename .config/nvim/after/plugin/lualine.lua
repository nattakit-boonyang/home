-- Plugin for display bottom status line
local lualine = require('lualine')

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'NvimTree',
        'packer',
      },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  extensions = { 'fugitive' },
})
