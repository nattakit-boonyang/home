-- https://github.com/norcalli/nvim-colorizer.lua
return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      local colorizer = require("colorizer")
      local filetypes = {
        "lua",
        "css",
        "scss",
        "html",
        "javascript",
        "go",
      }

      colorizer.setup(filetypes, {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },
}
