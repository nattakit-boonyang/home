-- Plugin: https://github.com/goolord/alpha-nvim
return {
  plugins.ui.repo_alpha,
  name = plugins.ui.alpha,
  event = "VimEnter",
  dependencies = plugins.ui.web_devicons,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene <CR>"),
      dashboard.button("SPC f f", "󰈞  Find file"),
      dashboard.button("SPC f r", "󰊄  Recently opened files"),
      dashboard.button("SPC f g", "󰈬  Find word"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)
  end,
}
