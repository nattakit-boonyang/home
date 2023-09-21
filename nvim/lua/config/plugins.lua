local _plugins = {
  coding = {
    completion = {},
    treesitter = "nvim-treesitter/nvim-treesitter",
  },
  editor = {
    mini = {
      mini = "echasnovski/mini.nvim",
      mini_surround = "echasnovski/mini.surround",
      mini_indentscope = "echasnovski/mini.indentscope",
    },
    catppuccin = "catppuccin/nvim",
    neo_tree = "nvim-neo-tree/neo-tree.nvim",
    lualine = "nvim-lualine/lualine.nvim",
    bufferline = "akinsho/bufferline.nvim",
    illuminate = "RRethy/vim-illuminate",
    tmux_navigator = "aserowy/tmux.nvim",
    flash = "folke/flash.nvim",
    telescope = "nvim-telescope/telescope.nvim",
  },
  ui = {
    web_devicons = "nvim-tree/nvim-web-devicons",
    nui = "MunifTanjim/nui.nvim",
    plenary = "nvim-lua/plenary.nvim",
    window_picker = "s1n7ax/nvim-window-picker",
  },
}

local new_table = function(t)
  return setmetatable({}, {
    __index = function(_, key)
      local is_base = key:sub(1, 5) == "repo_"
      if is_base then key = key:sub(6) end
      if t[key] == nil then return nil end
      if is_base then return t[key] end
      return key
    end,
  })
end

-- TODO: hard ways, fix later
_G.plugins = {
  coding = (function()
    local coding = new_table(_plugins.coding)
    coding.completion = new_table(_plugins.coding.completion)
    return coding
  end)(),
  editor = (function()
    local editor = new_table(_plugins.editor)
    editor.mini = new_table(_plugins.editor.mini)
    return editor
  end)(),
  ui = new_table(_plugins.ui),
}
