local keymap = vim.keymap
local wk = require('which-key')

-- Disable Arrow
local delete_key = function(lhs)
  local modes = { 'n', 'v', 'i', 'x', 's', 'o', 'l', 't' }
  keymap.set(modes, lhs, '<nop>', { remap = true, desc = 'Disable Key' })
end

delete_key('<down>')
delete_key('<up>')
delete_key('<left>')
delete_key('<right>')

-- Disable macro
keymap.set({ 'n', 'v' }, 'q', '<nop>', { remap = true, desc = 'Disable Key' })

local n_opts = {
  mode = 'n',
  silent = true,
  noremap = true,
}

wk.register({
  x = { '"_x', 'Delete Char' },
  ['dw'] = { 'vb"_d', 'Delete Word Backward' },
  ['g?'] = { '<cmd>WhichKey<cr>', 'WK All Mappings' },
  ['gctd'] = { function()
    local line = vim.api.nvim_get_current_line()
    vim.notify(string.format('-- TODO: %s', vim.trim(line)))
  end, 'Toggle Comment TODO' }

}, n_opts)

-- Map leader group options
local leader_opts = {
  mode = 'n',
  silent = true,
  noremap = true,
  prefix = '<leader>',
}
local buf_leader_opts = function(bufnr)
  local bo = leader_opts
  bo.buffer = bufnr
  return bo
end

-- Telescope
local builtin = require('telescope.builtin')
local new_telescope_preview_off = function(fn)
  return string.format([[<cmd>lua require('telescope.builtin').%s({previewer=false})<cr>]], fn)
end
wk.register({
  f = {
    name = 'Telescope',
    a = { new_telescope_preview_off('builtin'), 'All Pickers' },
    f = { builtin.find_files, 'Find File' },
    F = { new_telescope_preview_off('find_files'), 'Find File (No Preview)' },
    g = { builtin.live_grep, 'Live Grep' },
    G = { new_telescope_preview_off('live_grep'), 'Live Grep (No Preview)' },
    b = { builtin.buffers, 'Buffer' },
    B = { new_telescope_preview_off('buffers'), 'Buffer (No Preview)' },
    t = { '<cmd>TodoTelescope<cr>', 'Todo' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Recent File' },
  },
}, leader_opts)

-- Trouble Diagnostic
wk.register({
  x = {
    name = 'Trouble',
    x = { '<cmd>TroubleToggle<cr>', 'Toggle' },
    c = { '<cmd>TroubleClose<cr>', 'Close' },
    R = { '<cmd>TroubleRefresh<cr>', 'Refresh' },
    w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
    d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document' },
    q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix' },
    r = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
  },
}, leader_opts)

-- Editors
wk.register({
  e = {
    name = 'Editor',
    u = { '<cmd>UndotreeToggle<cr>', 'UndoTree' },
    e = { '<cmd>NvimTreeToggle<cr>', 'NvimTree' },
    w = { '<cmd>w<cr>', 'Write' },
    W = { '<cmd>w!<cr>', 'Write!' },
    q = { '<cmd>q!<cr>', 'Quit!' },
    Q = { '<cmd>qa!<cr>', 'Quit All!' },
  },
}, leader_opts)

-- Search
wk.register({
  s = {
    name = 'Search',
    h = { '<cmd>nohlsearch<cr>', 'Highlight Off' }
  },
}, leader_opts)

-- Buffers
wk.register({
  b = {
    name = 'Buffer',
    w = { '<cmd>bw<cr><cmd>blast<cr>', 'Wipeout' },
    W = { '<cmd>bw!<cr><cmd>blast<cr>', 'Wipeout!' },
    d = { '<cmd>bd<cr><cmd>blast<cr>', 'Delete' },
    D = { '<cmd>bd!<cr><cmd>blast<cr>', 'Delete!' },
    n = { '<cmd>BufferLineCyclePrev<cr>', 'Prev' },
    N = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
    l = { '<cmd>LspInfo<cr>', 'LSP Info' },
  },
}, leader_opts)

-- Lsp Code
local lsp_buf = vim.lsp.buf
local lsp_module = {
  register_mappings = function(client, bufnr)
    local buf_opts = buf_leader_opts(bufnr)
    local new_lsp_mapping = function(opts)
      -- set values
      if not opts.sign then
        if not (opts.state == nil) then
          opts.sign = '[✓]'
        else
          -- For label only
          opts.fn = function()
            vim.notify('Server not implement!', vim.log.levels.ERROR, { title = 'LSP Client' })
          end
          opts.sign = '[✗]'
        end
      end
      opts.desc = string.format('%s%s', opts.sign, opts.desc)

      -- register mapping
      wk.register({ [opts.mapping] = { opts.fn, opts.desc, buffer = bufnr } }, opts.opts)
    end
    -- Set label name
    new_lsp_mapping({
      mapping = 'c',
      opts = buf_opts,
      desc = 'LSP',
      sign = '[✓]',
    })
    new_lsp_mapping({
      mapping = 'cf',
      opts = buf_opts,
      fn = function()
        lsp_buf.format({ async = true, bufnr = bufnr })
      end,
      desc = 'Format Code',
      state = client.server_capabilities.documentFormattingProvider,
    })
    new_lsp_mapping({
      mapping = 'ch',
      opts = buf_opts,
      fn = lsp_buf.hover,
      desc = 'Hover',
      state = client.server_capabilities.hoverProvider,
    })
    new_lsp_mapping({
      mapping = 'cn',
      opts = buf_opts,
      fn = lsp_buf.rename,
      desc = 'Rename',
      state = client.server_capabilities.renameProvider,
    })
    new_lsp_mapping({
      mapping = 'cr',
      opts = buf_opts,
      fn = lsp_buf.references,
      desc = 'References',
      state = client.server_capabilities.referencesProvider,
    })
    new_lsp_mapping({
      mapping = 'ca',
      opts = buf_opts,
      fn = lsp_buf.code_action,
      desc = 'Code Action',
      state = client.server_capabilities.codeActionProvider,
    })
    new_lsp_mapping({
      mapping = 'cd',
      opts = buf_opts,
      fn = lsp_buf.definition,
      desc = 'Definition',
      state = client.server_capabilities.definitionProvider,
    })
    new_lsp_mapping({
      mapping = 'cD',
      opts = buf_opts,
      fn = lsp_buf.declaration,
      desc = 'Declaration',
      state = client.server_capabilities.declarationProvider,
    })
    new_lsp_mapping({
      mapping = 'cs',
      opts = buf_opts,
      fn = lsp_buf.signature_help,
      desc = 'Signature Help',
      state = client.server_capabilities.signatureHelpProvider,
    })
    new_lsp_mapping({
      mapping = 'ci',
      opts = buf_opts,
      fn = lsp_buf.implementation,
      desc = 'Implementation',
      state = client.server_capabilities.implementationProvider,
    })
  end,
}
wk.register({ c = '[✗]LSP' }, leader_opts)

-- Windows
wk.register({
  w = {
    name = 'Window',
    ['|'] = { '<c-w>v', 'New VW' },
    ['-'] = { '<c-w>s', 'New HW' },
    q = { '<c-w>q', 'Close W' },
  },
}, leader_opts)
wk.register({
  ['<c-h>'] = { '<c-w>h', 'Move Left W' },
  ['<c-j>'] = { '<c-w>j', 'Move Down W' },
  ['<c-k>'] = { '<c-w>k', 'Move Up W' },
  ['<c-l>'] = { '<c-w>l', 'Move Right W' },
}, n_opts)

return {
  lsp = lsp_module, -- Lsp Mapping Registration
}
