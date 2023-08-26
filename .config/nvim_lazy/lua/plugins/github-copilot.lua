-- https://github.com/zbirenbaum/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  name = "github-copilot",
  cmd = "Copilot",
  event = "LspAttach",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = true,
}
