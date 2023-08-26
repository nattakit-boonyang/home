-- https://github.com/cappyzawa/trim.nvim
return {
  "cappyzawa/trim.nvim",
  name = "file-trimmer",
  opts = {
    patterns = {
      [[%s/\(\n\n\)\n\+/\1/]],
    },
  },
}
