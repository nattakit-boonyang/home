-- https://github.com/nvim-lualine/lualine.nvim
local lazystatus = require("lazy.status")
return {
  "nvim-lualine/lualine.nvim",
  name = "lualine",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    sections = {
      lualine_x = {
        {
          lazystatus.updates,
          cond = lazystatus.has_updates,
          color = { fg = "#ff9e64" },
        },
      },
    },
  },
}
