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
keymap.set({ 'n', 'v' }, 'Q', '', { remap = true, desc = 'Disable Key' })

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
  o = new_opts('o'), -- Default: motions
  x = new_opts('x'), -- Default: motions
  set_buf = function(opts, bufnr)
    opts.buffer = bufnr
    return opts
  end,
}

-- TODO: design it!
local quit = function()
  -- Delete Windows
  if vim.tbl_count(vim.api.nvim_tabpage_list_wins(0)) > 0 then
    local status, _ = pcall(vim.api.nvim_win_close, 0, true)
    if status then return end
  end

  -- Delete Buffers
  local status, _ = pcall(vim.api.nvim_buf_delete, 0, { force = true })
  if status then return end

  -- Delete
  local buf_line_count = vim.api.nvim_buf_line_count(0)
  local buf_name = vim.api.nvim_buf_get_name(0)
  if (buf_line_count == 0) and (buf_name == '') then
  end

  -- local is_valid = function(buff)
  --   vim.pretty_print(buff)
  --   return vim.api.nvim_buf_is_valid(buff) and vim.api.nvim_buf_is_valid(buff)
  -- end
  -- local buffers = vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
  -- local cmd = '<cmd>bd!<cr>'
  -- vim.pretty_print(buffers)
  -- vim.pretty_print(vim.api.nvim_buf_is_loaded(27))
  -- vim.pretty_print(vim.api.nvim_buf_is_valid(27))
  -- if buffers == 1 then
  --   cmd = '<cmd>q!<cr>'
  -- end
  -- pcall(vim.cmd, cmd)
end

wk.register({
  ['g?'] = { '<cmd>WhichKey<cr>', 'WK All Mappings' },
  x = { '"_x', 'Delete Char' },
  dw = { 'vb"_d', 'Delete Word Backward' },
  -- q = { quit, 'Quit Buffer' },
  q = { '<cmd>bd!<cr>', 'Quit' },
  Q = { '<cmd>q!<cr>', 'Quit' },
}, mode_opts.n)

-- CamelCase Motion
for _, mode in ipairs({ mode_opts.o, mode_opts.x }) do
  wk.register({
    ['i,'] = {
      name = 'InnerCase',
      w = { '<Plug>CamelCaseMotion_iw', 'Word Forward' },
      b = { '<Plug>CamelCaseMotion_ib', 'Word Backward' },
      e = { '<Plug>CamelCaseMotion_ie', 'End of Word' },
    },
    [','] = {
      name = 'MoveCase',
      w = { '<Plug>CamelCaseMotion_w', 'Word Forward' },
      b = { '<Plug>CamelCaseMotion_b', 'Word Backward' },
      e = { '<Plug>CamelCaseMotion_e', 'End of Word' },
    },
  }, mode)
end

for _, mode in ipairs({ 'n', 'v' }) do
  wk.register({
    w = { '<Plug>CamelCaseMotion_w', 'Word Forward [Case]' },
    b = { '<Plug>CamelCaseMotion_b', 'Word Backward [Case]' },
    e = { '<Plug>CamelCaseMotion_e', 'End of Word [Case]' },
  }, {
    mode = mode,
    remap = true,
    silent = true,
    prefix = ',',
  })
end

-- Move Lines
wk.register({
  ['<m-[>'] = { ':MoveLine(1)<cr>', 'Move LDown' },
  ['<m-]>'] = { ':MoveLine(-1)<cr>', 'Move LUp' },
}, mode_opts.n)
wk.register({
  ['<m-[>'] = { ':MoveBlock(-1)<cr>', 'Move BUp' },
  ['<m-]>'] = { ':MoveBlock(1)<cr>', 'Move BDown' },
}, mode_opts.v)

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
    a = { '<cmd>ASToggle<CR>', 'Autosave' },
  }
}, mode_opts.n_leader)

-- Telescope
local telescope_builtin = require('telescope.builtin')
local new_telescope_preview_off = function(fn)
  return string.format([[<cmd>lua require('telescope.builtin').%s({previewer=false})<cr>]], fn)
end
wk.register({
  f = {
    name = 'Telescope',
    a = { new_telescope_preview_off('builtin'), '[A]ll Pickers' },
    f = { telescope_builtin.find_files, '[F]ind [F]ile' },
    g = { telescope_builtin.live_grep, 'Live [G]rep' },
    b = { telescope_builtin.buffers, '[B]uffer' },
    t = { '<cmd>Telescope telescope-tabs list_tabs<cr>', '[T]abs', },
    o = { '<cmd>TodoTelescope<cr>', 'T[o]do' },
    r = { '<cmd>Telescope oldfiles<cr>', '[R]ecent File' },
    B = { '<cmd>Telescope file_browser<cr>', 'File [B]rowser' },
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
    s = { '<cmd>source%<cr>', 'Source Current F' },
    l = { '<cmd>LspInfo<cr>', 'LSP Info' },
    u = { '<cmd>UndotreeToggle<cr>', 'UndoTree' },
    e = { '<cmd>NvimTreeToggle<cr>', 'NvimTree' },
    w = { '<cmd>w<cr>', 'Write' },
    q = { '<cmd>q!<cr>', 'Quit!' },
  },
}, mode_opts.n_leader)

-- Search
wk.register({
  s = {
    name = 'Search',
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
    e = { '<cmd>e ' .. plugin_path .. '<cr>', 'Edit Plugin' },
  },
}, mode_opts.n_leader)

-- Lsp Code
local lsp_buf = vim.lsp.buf
local lsp_module = {
  register_mappings = function(client, bufnr, opts)
    local buf_opts = mode_opts.set_buf(mode_opts.n, bufnr)
    local new_lsp_mapping = function(opts)
      -- set values
      opts.mapping = opts.mapping or ''

      if not opts.sign then
        if not (opts.state == nil) then
          opts.sign = '+'
        else
          -- For label only
          opts.fn = function()
            vim.notify('Server not implement!', vim.log.levels.ERROR, { title = 'LSP Client' })
          end
          opts.sign = '-'
        end
      end
      opts.desc = string.format('%s%s', opts.sign, opts.desc)

      -- register mapping
      wk.register({ [opts.mapping] = { opts.fn, opts.desc, buffer = bufnr } }, opts.opts)
    end
    new_lsp_mapping({
      mapping = 'ff',
      opts = buf_opts,
      fn = function() opts.fn_format(bufnr) end,
      desc = '[F]ormat [F]ile',
      state = client.server_capabilities.documentFormattingProvider,
    })
    new_lsp_mapping({
      mapping = 'K',
      opts = buf_opts,
      fn = lsp_buf.hover,
      desc = 'Hover',
      state = client.server_capabilities.hoverProvider,
    })
    new_lsp_mapping({
      mapping = 'cn',
      opts = buf_opts,
      fn = lsp_buf.rename,
      desc = '[C]hange [N]ame',
      state = client.server_capabilities.renameProvider,
    })
    new_lsp_mapping({
      mapping = 'gR',
      opts = buf_opts,
      fn = telescope_builtin.lsp_references,
      desc = '[G]oto [R]eferences',
      state = client.server_capabilities.referencesProvider,
    })
    new_lsp_mapping({
      mapping = 'gca',
      opts = buf_opts,
      fn = lsp_buf.code_action,
      desc = '[G]oto [C]ode [A]ction',
      state = client.server_capabilities.codeActionProvider,
    })
    new_lsp_mapping({
      mapping = 'gd',
      opts = buf_opts,
      fn = telescope_builtin.lsp_definitions,
      desc = '[G]oto [D]efinition',
      state = client.server_capabilities.definitionProvider,
    })
    new_lsp_mapping({
      mapping = 'gD',
      opts = buf_opts,
      fn = telescope_builtin.lsp_type_definitions,
      desc = '[G]oto Type [D]efinition',
      state = client.server_capabilities.typeDefinitionProvider,
    })
    new_lsp_mapping({
      mapping = 'gh',
      opts = buf_opts,
      fn = lsp_buf.signature_help,
      desc = '[G]oto Signature [H]elp',
      state = client.server_capabilities.signatureHelpProvider,
    })
    new_lsp_mapping({
      mapping = 'gI',
      opts = buf_opts,
      fn = telescope_builtin.lsp_implementations,
      desc = '[G]oto [I]mplementation',
      state = client.server_capabilities.implementationProvider,
    })
    new_lsp_mapping({
      mapping = 'gs',
      opts = buf_opts,
      fn = telescope_builtin.lsp_document_symbols,
      desc = '[G]oto [S]ymbol',
      state = client.server_capabilities.documentSymbolProvider,
    })
  end,
}

-- Controller (Tabs, Buffers, Windows)
local tmux = require('tmux')
wk.register({
  ['<m-h>'] = { tmux.resize_left, 'Resize WLeft' },
  ['<m-j>'] = { tmux.resize_bottom, 'Resize WBottom' },
  ['<m-k>'] = { tmux.resize_top, 'Resize WTop' },
  ['<m-l>'] = { tmux.resize_right, 'Resize WRight' },
}, mode_opts.n)
wk.register({
  w = {
    name = 'Window',
    ['\\'] = { '<cmd>wincmd v<cr>', 'New VW' },
    ['-'] = { '<cmd>wincmd s<cr>', 'New HW' },
    q = { '<cmd>wincmd q<cr>', '[Q]uit W' },
  },
  t = {
    name = 'Tabs',
    e = { '<cmd>tabnew<cr>', '[E]dit T' },
    l = { '<cmd>tabnext<cr>', '[N]ext T' },
    h = { '<cmd>tabprevious<cr>', '[P]rev T' },
    q = { '<cmd>tabclose<cr>', '[Q]uit T' },
  },
  b = {
    name = 'Buffer',
    e = { '<cmd>enew<cr>', '[E]dit B' },
    d = { '<cmd>bd!<cr><cmd>blast<cr>', '[D]elete B' },
    l = { '<cmd>bnext<cr>', '[N]ext B' },
    h = { '<cmd>bprevious<cr>', '[P]rev B' },
  },
}, mode_opts.n_leader)

-- Terminal
local term_module = {
  register_mappings = function()
    local opts = {
      mode = 't',
      silent = true,
      buffer = 0,
    }
    wk.register({
      ['<esc>'] = { [[ <c-\><c-n> ]], 'Terminal Normal Mode' },
      ['<c-[>'] = { [[ <c-\><c-n> ]], 'Terminal Normal Mode' },
      ['<c-h>'] = { '<cmd>wincmd h<cr>', 'Move Left W' },
      ['<c-j>'] = { '<cmd>wincmd j<cr>', 'Move Down W' },
      ['<c-k>'] = { '<cmd>wincmd k<cr>', 'Move Up W' },
      ['<c-l>'] = { '<cmd>wincmd l<cr>', 'Move Right W' },
    }, opts)
  end,
}
local term = require('after.plugin.toggleterm')
wk.register({
  [','] = {
    name = 'Terminal',
    l = { term.new_cmd('lazygit'), 'Lazygit' },
    s = { term.new_cmd('zsh'), 'Shell' },
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
  opts = vim.list_extend(opts or {}, { '-v', '-F' })
  return function()
    require('go.gotest')[fn](unpack(opts))
  end
end
local add_test = function(fn, opts)
  opts = vim.list_extend(opts or {}, { '-v', '-F' })
  return function()
    require('go.gotests')[fn](unpack(opts))
  end
end
local desc_format = function(text)
  return string.format('%s', text)
end
local go_module = {
  register_mappings = function(bufnr)
    local buf_opts = mode_opts.set_buf(mode_opts.n_leader, bufnr)
    wk.register({
      m = {
        name = desc_format('[M]odule'),
        i = { input_run('mod'), desc_format('[I]nitial') },
        t = { require('go.gopls').tidy, desc_format('[T]idy') },
        g = { input_run('goget'), desc_format('[G]et Package') },
      },
      g = {
        name = desc_format('[G]enerator'),
        c = { require('go.comment').gen, desc_format('Function [C]omment') },
        r = { require('go.lsp').hover_returns, desc_format('Variable [R]eturn') },
        i = { input_run('impl'), desc_format('[I]nterface') }
      },
      r = {
        name = desc_format('[T]est'),
        s = { run_test('test_func', { '-s' }), desc_format('[S]elect') },
        c = { run_test('test_func'), desc_format('[C]ursor') },
        f = { run_test('test_file'), desc_format('[F]ile') },
        p = { run_test('test_package'), desc_format('[P]ackage') },
        a = {
          name = desc_format('[A]ll Mode'),
          a = { add_test('all_test', { '-parallel' }), desc_format('[A]dd All') },
          c = { add_test('fun_test', { '-parallel' }), desc_format('[A]dd Cursor') },
          e = { add_test('exported_test', { '-parallel' }), desc_format('[A]dd Public') },
        },
      },
      h = {
        name = desc_format('[H]elper'),
        d = { input_run('godoc'), desc_format('[D]ocumentation') },
        c = { input_run('chtsh'), desc_format('[C]heat') },
        i = { require('go.inlay').toggle_inlay_hints, desc_format('Toggle [I]nlay Hints') },
        o = { require('go.package').outline, desc_format('Toggle Package [O]utline') },
        l = { '<cmd>GoLint<cr>', desc_format('Go [L]int') },
      },
    }, buf_opts)
  end,
}

return {
  lsp = lsp_module, -- Lsp Mapping Registration
  go = go_module, -- Go Mapping Registration
  term = term_module, -- Terminal Mapping Registration
}
