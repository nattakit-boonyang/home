-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping["<Tab>"] = cmp.mapping.confirm({ select = false })
    opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
    return opts
  end,
}
