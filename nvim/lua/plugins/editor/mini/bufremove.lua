-- Plugin: https://github.com/echasnovski/mini.bufremove
return {
  plugins.editor.mini.repo_mini_bufremove,
  name = plugins.editor.mini.mini_bufremove,
  config = function(_, opts)
    require("mini.bufremove").setup(opts)
  end,
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "󰺝 Delete",
    },
  },
}
