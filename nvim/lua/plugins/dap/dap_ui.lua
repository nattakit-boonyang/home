-- Plugin: https://github.com/rcarriga/nvim-dap-ui
return {
  plugins.dap.repo_dap_ui,
  name = plugins.dap.dap_ui,
  dependencies = plugins.dap.dap,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.setup({})
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
}
