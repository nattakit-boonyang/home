-- Plugin: https://github.com/rcarriga/nvim-notify
return {
  plugins.ui.repo_notify,
  name = plugins.ui.notify,
  config = true,
  keys = {
    {
      "<leader>on",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications"
    },
  },
}
