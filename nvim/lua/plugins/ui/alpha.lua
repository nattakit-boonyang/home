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
      dashboard.button("e", "  New file", "<cmd>ene <cr>"),
      dashboard.button("<leader> f f", "󰍉  Find file"),
      dashboard.button("<leader> f r", "󰘓  Recently opened files"),
      dashboard.button("<leader> f g", "󰮗  Find word"),
      dashboard.button("q", "󰗼  Quit NVIM", "<cmd>qa!<cr>"),
    }
    alpha.setup(dashboard.config)
  end,
}
