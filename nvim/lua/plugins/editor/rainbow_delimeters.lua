-- Plugin: https://github.com/HiPhish/rainbow-delimiters.nvim
return {
  plugins.editor.repo_rainbow_delimiters,
  name = plugins.editor.rainbow_delimiters,
  event = "VeryLazy",
  config = function()
    local delimetirs = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = delimetirs.strategy["global"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        javascript = "rainbow-delimiters-react",
        tsx = "rainbow-delimiters-react",
      },
      highlight = {
        "RainbowDelimiterYellow",
        "RainbowDelimiterRed",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
