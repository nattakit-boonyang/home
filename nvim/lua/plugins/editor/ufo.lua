-- Plugin: https://github.com/kevinhwang91/nvim-ufo
return {
  plugins.editor.repo_ufo,
  name = plugins.editor.ufo,
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "zR", function() require("ufo").openAllFolds() end,  desc = "Open All Folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close All Folds" },
  },
}
