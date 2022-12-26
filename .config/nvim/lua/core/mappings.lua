local keymap = vim.keymap
local wk = require('which-key')

-- Disable Arrow
local delete_key = function(lhs)
  local modes = { 'n', 'v', 'i', 'x', 's', 'o', 'l', 't' }
  keymap.set(modes, lhs, '', { remap = true, desc = 'Disable Key' })
end

delete_key('<down>')
delete_key('<up>')
delete_key('<left>')
delete_key('<right>')

-- Disable macro
keymap.set({ 'n', 'v' }, 'q', '', { remap = true, desc = 'Disable Key' })

-- group options
local new_opts = function(mode, prefix)
  return {
    mode = mode,
    silent = true,
    noremap = true,
    prefix = prefix,
  }
end
local mode_opts = {
  n = new_opts('n'), -- Default: normal mode
  n_leader = new_opts('n', '<leader>'), -- Default: normal mode (prefix: <leader>)
  v = new_opts('v'), -- Default: visual mode
  t = new_opts('t'), -- Default: terminal mode
  set_buf = function(opts, bufnr)
    opts.buffer = bufnr
    return opts
  end,
}

wk.register({
  ['g?'] = { '<cmd>WhichKey<cr>', 'WK All Mappings' },
  x = { '"_x', 'Delete Char' },
  ['dw'] = { 'vb"_d', 'Delete Word Backward' },
  ['dD'] = { 'd"_d', 'Delete Line [Wipe]' },
  -- TODO: rewrite insert below line
  ['go'] = { 'o<esc>`k', 'Insert Below New Line' },
  ['gO'] = { 'O<esc>`j', 'Insert Above New Line' },
}, mode_opts.n)

-- Move Lines
wk.register({
  ['<a-m>'] = { '<cmd>MoveLine(-1)<cr>', 'Move [Line] Up' },
  ['<a-M>'] = { '<cmd>MoveLine(1)<cr>', 'Move [Line] Down' },
}, mode_opts.n)
-- wk.register({
--   ['<a-m>'] = { '<cmd>MoveBlock(-1)<cr>', 'Move [Block] Up' },
--   ['<a-M>'] = { '<cmd>MoveBlock(1)<cr>', 'Move [Block] Down' },
-- }, mode_opts.v)
vim.keymap.set('n', '<a-m>', ':MoveLine(-1)<cr>')
vim.keymap.set('n', '<m-m>', ':MoveLine(-1)<cr>')

-- Options
local toggleOption = function(name, bufnr)
  return function()
    bufnr = bufnr or 0
    local opts = { buf = bufnr }
    local v = not vim.api.nvim_get_option_value(name, opts)
    vim.api.nvim_set_option_value(name, v, opts)
  end
end

wk.register({
  o = {
    name = 'Options',
    l = { toggleOption('list'), 'List' },
    h = { toggleOption('hlsearch'), 'Hightlight' },
    n = { toggleOption('number'), 'Number' },
    N = { toggleOption('relativenumber'), 'Relative Numer' },
  }
}, mode_opts.n_leader)

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
}, mode_opts.n_leader)

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
}, mode_opts.n_leader)

-- Editors
wk.register({
  e = {
    name = 'Editor',
    l = { '<cmd>LspInfo<cr>', 'LSP Info' },
    u = { '<cmd>UndotreeToggle<cr>', 'UndoTree' },
    e = { '<cmd>NvimTreeToggle<cr>', 'NvimTree' },
    w = { '<cmd>w<cr>', 'Write' },
    W = { '<cmd>w!<cr>', 'Write!' },
    q = { '<cmd>q!<cr>', 'Quit!' },
    Q = { '<cmd>qa!<cr>', 'Quit All!' },
  },
}, mode_opts.n_leader)

-- Search
wk.register({
  s = {
    name = 'Search',
  },
}, mode_opts.n_leader)

-- Buffers
wk.register({
  b = {
    name = 'Buffer',
    w = { '<cmd>bw!<cr><cmd>NvimTreeClose<cr><cmd>blast<cr>', 'Wipeout' },
    d = { '<cmd>bd!<cr><cmd>NvimTreeClose<cr><cmd>blast<cr>', 'Delete' },
    n = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
    N = { '<cmd>BufferLineCyclePrev<cr>', 'Prev' },
  },
}, mode_opts.n_leader)

-- Plugin
local plugin_path = vim.fn.stdpath('config') .. '/lua/plugins.lua'
wk.register({
  p = {
    name = 'Plugin',
    c = { '<cmd>PackerCompile<cr>', 'PackerCompile' },
    s = { '<cmd>PackerSync<cr>', 'PackerSync' },
    i = { '<cmd>PackerInstall<cr>', 'PackerInstall' },
    n = { '<cmd>PackerClean<cr>', 'PackerClean' },
    p = { '<cmd>e ' .. plugin_path .. '<cr>', 'Edit Plugin' },
  },
}, mode_opts.n_leader)

-- Lsp Code
local lsp_buf = vim.lsp.buf
local lsp_module = {
  register_mappings = function(client, bufnr, opts)
    local buf_opts = mode_opts.set_buf(mode_opts.n_leader, bufnr)
    local new_lsp_mapping = function(opts)
      -- set values
      opts.mapping = opts.mapping or ''
      opts.mapping = string.format('c%s', opts.mapping) -- Add 'c' prefix

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
      opts = buf_opts,
      desc = 'LSP',
      sign = '[✓]',
    })
    new_lsp_mapping({
      mapping = 'f',
      opts = buf_opts,
      fn = function() opts.fn_format(bufnr) end,
      desc = 'Format Code',
      state = client.server_capabilities.documentFormattingProvider,
    })
    new_lsp_mapping({
      mapping = 'h',
      opts = buf_opts,
      fn = lsp_buf.hover,
      desc = 'Hover',
      state = client.server_capabilities.hoverProvider,
    })
    new_lsp_mapping({
      mapping = 'n',
      opts = buf_opts,
      fn = lsp_buf.rename,
      desc = 'Rename',
      state = client.server_capabilities.renameProvider,
    })
    new_lsp_mapping({
      mapping = 'r',
      opts = buf_opts,
      fn = lsp_buf.references,
      desc = 'References',
      state = client.server_capabilities.referencesProvider,
    })
    new_lsp_mapping({
      mapping = 'a',
      opts = buf_opts,
      fn = lsp_buf.code_action,
      desc = 'Code Action',
      state = client.server_capabilities.codeActionProvider,
    })
    new_lsp_mapping({
      mapping = 'd',
      opts = buf_opts,
      fn = lsp_buf.definition,
      desc = 'Definition',
      state = client.server_capabilities.definitionProvider,
    })
    new_lsp_mapping({
      mapping = 'D',
      opts = buf_opts,
      fn = lsp_buf.declaration,
      desc = 'Declaration',
      state = client.server_capabilities.declarationProvider,
    })
    new_lsp_mapping({
      mapping = 'g',
      opts = buf_opts,
      fn = lsp_buf.signature_help,
      desc = 'Signature Help',
      state = client.server_capabilities.signatureHelpProvider,
    })
    new_lsp_mapping({
      mapping = 'i',
      opts = buf_opts,
      fn = lsp_buf.implementation,
      desc = 'Implementation',
      state = client.server_capabilities.implementationProvider,
    })
    new_lsp_mapping({
      mapping = 's',
      opts = buf_opts,
      fn = lsp_buf.document_symbol,
      desc = 'Document Symbol',
      state = client.server_capabilities.documentSymbolProvider,
    })
    new_lsp_mapping({
      mapping = 't',
      opts = buf_opts,
      fn = lsp_buf.type_definition,
      desc = 'Type Definition',
      state = client.server_capabilities.typeDefinitionProvider,
    })
  end,
}
wk.register({ c = '[✗]LSP' }, mode_opts.n_leader)

-- Windows
wk.register({
  w = {
    name = 'Window',
    ['|'] = { '<c-w>v', 'New VW' },
    ['-'] = { '<c-w>s', 'New HW' },
    q = { '<c-w>q', 'Close W' },
  },
}, mode_opts.n_leader)
wk.register({
  ['<c-]>'] = { '<cmd>ToggleTerm<cr>', 'Toggle Terminal Windows' },
}, mode_opts.n)

-- Terminal
local term_module = {
  register_mappings = function()
    local opts = {
      mode = 't',
      silent = true,
      buffer = 0,
    }
    wk.register({
      ['<c-]>'] = { '<cmd>ToggleTerm<cr>', 'Toggle Terminal Windows' },
      ['<esc>'] = { [[ <c-\><c-n> ]], 'Terminal Normal Mode' },
      ['<c-[>'] = { [[ <c-\><c-n> ]], 'Terminal Normal Mode' },
      ['<c-h>'] = { '<cmd>wincmd h<cr>', 'Move Left W' },
      ['<c-j>'] = { '<cmd>wincmd j<cr>', 'Move Down W' },
      ['<c-k>'] = { '<cmd>wincmd k<cr>', 'Move Up W' },
      ['<c-l>'] = { '<cmd>wincmd l<cr>', 'Move Right W' },
    }, opts)
  end,
}

-- Test Mode
local test_path = vim.fn.stdpath('config') .. '/lua/test.lua'
wk.register({
  t = {
    s = { '<cmd>source%<cr>', 'Source' },
    e = { string.format('<cmd>e %s<cr>', test_path), 'Open Test File' },
  },
}, mode_opts.n_leader)

-- Golang
local input_run = function(name)
  return function()
    vim.ui.input(name, function(input)
      local opts = vim.split(input, '%s')
      require(string.format('go.%s', name)).run(unpack(opts))
    end)
  end
end
local run_test = function(fn, opts)
  opts = vim.list_extend(opts or {}, { '-F' })
  return function()
    require('go.gotest')[fn](unpack(opts))
  end
end
local add_test = function(fn, opts)
  opts = vim.list_extend(opts or {}, { '-F' })
  return function()
    require('go.gotests')[fn](unpack(opts))
  end
end

local go_module = {
  register_mappings = function(bufnr)
    local buf_opts = mode_opts.set_buf(mode_opts.n_leader, bufnr)
    wk.register({
      m = {
        name = '[]Module',
        i = { input_run('mod'), 'Initial' },
        t = { require('go.gopls').tidy, 'Tidy' },
        g = { input_run('goget'), 'Get Package' },
      },
      g = {
        name = '[]Generator',
        c = { require('go.comment').gen, 'Function Comment' },
        r = { require('go.lsp').hover_returns, 'Variable Return' },
        i = { input_run('impl'), 'Interface' }
      },
      t = {
        name = '[]Test',
        s = { run_test('test_func', { '-s' }), 'Select' },
        c = { run_test('test_func'), 'Cursor' },
        f = { run_test('test_file'), 'File' },
        p = { run_test('test_package'), 'Package' },
        ['aa'] = { add_test('all_test', { '-parallel' }), 'Add All' },
        ['ac'] = { add_test('fun_test', { '-parallel' }), 'Add Cursor' },
        ['ae'] = { add_test('exported_test', { '-parallel' }), 'Add Public' },
      },
      h = {
        name = '[]Helper',
        c = { input_run('godoc'), 'Documentation' },
        d = { input_run('chtsh'), 'Cheat' },
        t = { require('go.inlay').toggle_inlay_hints, 'Toggle Inlay Hints' },
        o = { require('go.package').outline, 'Toggle Package Outline' },
        l = { '<cmd>GoLint<cr>', 'Go Lint' },
      },
    }, buf_opts)
  end,
}

return {
  lsp = lsp_module, -- Lsp Mapping Registration
  go = go_module, -- Go Mapping Registration
  term = term_module, -- Terminal Mapping Registration
}
