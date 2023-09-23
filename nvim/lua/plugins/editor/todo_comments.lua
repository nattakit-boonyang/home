-- Plugin: https://github.com/folke/todo-comments.nvim
return {
  plugins.editor.repo_todo_comments,
  name = plugins.editor.todo_comments,
  dependencies = plugins.ui.plenary,
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "󰍉 Todo" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = " Todo" },
  },
}
