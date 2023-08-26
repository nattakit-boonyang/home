-- https://github.com/akinsho/bufferline.nvim
return {
  "akinsho/bufferline.nvim",
  name = "bufferline",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "tabs",
      numbers = function(opts)
        return string.format("%s.%s", opts.id, opts.lower(opts.ordinal))
      end,
      always_show_bufferline = true,
      separator_style = "slant",
      indicator = {
        icon = "▎",
        style = "icon",
      },
      diagnostics = "nvim_lsp",
      color_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" }
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "Outline",
          text = "Symbols Outline",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  config = true,
}
