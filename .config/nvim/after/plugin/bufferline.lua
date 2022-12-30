local bufferline = require('bufferline')

bufferline.setup({
  options = {
    mode = 'tabs',
    numbers = function(opts)
      return string.format('%s.%s', opts.id, opts.lower(opts.ordinal))
    end,
    always_show_bufferline = true,
    separator_style = 'slant',
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
        separator = true,
      },
      {
        filetype = 'undotree',
        text = 'Undotree',
        text_align = 'center',
        separator = true,
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
  },
})
