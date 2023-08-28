-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/f3fora/cmp-spell

local sources = {
  {
    name = "spell",
    option = {
      keep_all_entries = false,
    },
  },
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "f3fora/cmp-spell" },
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- add sources
    for _, source in ipairs(sources) do
      table.insert(opts.sources, source)
    end
    opts.sources = cmp.config.sources(opts.sources)

    -- add keymaps
    local selected = cmp.mapping.confirm({ select = false })
    opts.mapping["<Tab>"] = selected
    opts.mapping["<CR>"] = selected

    return opts
  end,
}
