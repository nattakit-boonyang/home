-- Plugin: https://github.com/echasnovski/mini.bufremove
return new_plugin(plugins.editor.mini_bufremove).load_when_pressed({
  "<leader>bd",
  function()
    require("mini.bufremove").delete(0, false)
  end,
  desc = "Delete Buffer",
})
