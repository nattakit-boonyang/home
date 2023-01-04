-- Multiple mode mappings
local wk = require('which-key')
local key_register = function(opts, ...)
  local c_modes = select('#', ...)
  if c_modes == 0 then return end
  local modes = { ... }
  for _, mode in ipairs(modes) do
    wk.register(opts, mode)
  end
end

-- Group options
local new_mode_opts = function(mode, prefix)
  return {
    mode = mode,
    silent = true,
    noremap = true,
    prefix = prefix,
  }
end

local modes = {
  n = new_mode_opts('n'), -- Default: normal mode
  n_leader = new_mode_opts('n', '<leader>'), -- Default: normal mode (prefix: <leader>)
  n_comma = new_mode_opts('n', ','), -- Default: normal mode (prefix: ,)
  x_comma = new_mode_opts('x', ','), -- Default: normal mode (prefix: ,)
  v = new_mode_opts('v'), -- Default: visual mode
  t = new_mode_opts('t'), -- Default: terminal mode
  o = new_mode_opts('o'), -- Default: motions
  x = new_mode_opts('x'), -- Default: motions
  set_buf = function(opts, bufnr)
    opts.buffer = bufnr
    return opts
  end,
}

-- Disable key
local key_disable = function(lhs_list)
  if type(lhs_list) == 'string' then
    lhs_list = { lhs_list }
  end
  for _, lhs in ipairs(lhs_list) do
    key_register({
      [lhs] = { '', 'Disable Key' },
    }, {
      mode = 'n',
      noremap = false,
      silent = true,
    }, {
      mode = 'v',
      noremap = false,
      silent = true,
    })
  end
end

local quit = function()
  -- Delete Windows
  local c_wins = vim.tbl_count(vim.api.nvim_tabpage_list_wins(0))
  if c_wins >= 1 then
    local status, _ = pcall(vim.api.nvim_win_close, 0, true)
    if status then return end
  end

  -- Delete Tabs
  local c_tabs = vim.tbl_count(vim.api.nvim_list_tabpages())
  if c_tabs >= 1 then
    local status, _ = pcall(vim.cmd, ':tabclose<cr>')
    if status then return end
  end

  -- Prompt Wipeout Buffer
  vim.ui.select({ 'No', 'Yes' }, {
    prompt = 'Confirm to wipeout buffer and exit',
  }, function(choice)
    if choice == 'Yes' then
      local buffers = vim.api.nvim_list_bufs()
      for _, buf in ipairs(buffers) do
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end
    end
    pcall(vim.cmd, ':qa!')
  end)
end

-- Toggle last line comma
local toggle_suffix = function(ch)
  return function()
    local line = vim.api.nvim_get_current_line()
    local pattern = string.format('%s$', ch)
    if ch == '.' then pattern = '%' .. pattern end
    if line:match(pattern) then
      line = line:gsub(pattern, '')
    else
      line = line .. ch
    end
    vim.api.nvim_set_current_line(line)
  end
end

-- Insert line count
local insert_line = function(offset)
  offset = offset or 0
  return function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1] + offset
    local count = vim.api.nvim_get_vvar('count')
    -- Single line
    if count == 0 then count = 1 end
    for _ = 0, count - 1 do
      vim.api.nvim_buf_set_lines(0, line, line, false, { '' })
    end
  end
end

-- Disable macro
key_disable({ 'q', 'Q' })

-- General Mappings
key_register({
  ['g?'] = { '<cmd>WhichKey<cr>', '[G]oto WhichKey Mappings[?]' },
  x = { '"_x', '[D]elete Char (Hole)' },
  dw = { 'vb"_d', '[D]elete [W]ord Backward' },
  q = { quit, 'Delete Buffer' },
}, modes.n)

key_register({
  o = { insert_line(), 'Insert below empty line' },
  O = { insert_line(-1), 'Insert above empty line' },
  [','] = { toggle_suffix(','), 'Toggle last line comma' },
  ['.'] = { toggle_suffix('.'), 'Toggle last line dot' },
  d = { '"_d', '[D]elete (Hole)' },
  c = { '"_c', '[C]hange (Hole)' },
}, modes.n_comma, modes.x_comma)

-- CamelCase and SnakeCase Motion
for _, mode in ipairs({ modes.o, modes.x }) do
  key_register({
    ['i,'] = {
      name = 'InnerCase',
      w = { '<Plug>CamelCaseMotion_iw', '[W]ord Forward' },
      b = { '<Plug>CamelCaseMotion_ib', 'Word [B]ackward' },
      e = { '<Plug>CamelCaseMotion_ie', '[E]nd of Word' },
    },
    [','] = {
      name = 'MoveCase',
      w = { '<Plug>CamelCaseMotion_w', '[W]ord Forward' },
      b = { '<Plug>CamelCaseMotion_b', 'Word [B]ackward' },
      e = { '<Plug>CamelCaseMotion_e', '[E]nd of Word' },
    },
  }, mode)
end

key_register({
  w = { '<Plug>CamelCaseMotion_w', '[W]ord Forward' },
  b = { '<Plug>CamelCaseMotion_b', 'Word [B]ackwad' },
  e = { '<Plug>CamelCaseMotion_e', '[E]nd of Word' },
}, modes.n_comma, modes.x_comma)

-- Move Lines
key_register({
  ['<m-[>'] = { ':MoveLine(1)<cr>', '[Move LDown' },
  ['<m-]>'] = { ':MoveLine(-1)<cr>', 'Move LUp]' },
}, modes.n)
key_register({
  ['<m-[>'] = { ':MoveBlock(-1)<cr>', '[Move BUp' },
  ['<m-]>'] = { ':MoveBlock(1)<cr>', 'Move BDown]' },
}, modes.v)

-- Options
local toggle_opt = function(name, bufnr)
  return function()
    bufnr = bufnr or 0
    local opts = { buf = bufnr }
    local v = not vim.api.nvim_get_option_value(name, opts)
    vim.api.nvim_set_option_value(name, v, opts)
  end
end

key_register({
  o = {
    name = '[O]ptions',
    l = { toggle_opt('list'), '[L]ist' },
    h = { toggle_opt('hlsearch'), '[H]ightlight' },
  }
}, modes.n_leader)

-- Telescope
local telescope_builtin = require('telescope.builtin')
local new_telescope_preview_off = function(fn)
  return string.format([[<cmd>lua require('telescope.builtin').%s({previewer=false})<cr>]], fn)
end
key_register({
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
}, modes.n_leader)

-- Editors
key_register({
  w = { '<cmd>w<cr>', '[W]rite' },
  e = {
    name = '[E]ditor',
    s = { '<cmd>source%<cr>', '[S]ource Current F' },
    l = { '<cmd>LspInfo<cr>', '[L]SP Info' },
    u = { '<cmd>UndotreeToggle<cr>', '[U]ndoTree' },
    e = { '<cmd>NvimTreeToggle<cr>', 'NvimTre[e]' },
    q = { '<cmd>q!<cr>', '[Q]uit!' },
  },
}, modes.n_leader)

-- Plugin
key_register({
  p = {
    name = '[P]lugin',
    C = { '<cmd>PackerCompile<cr>', 'Packer[C]ompile' },
    s = { '<cmd>PackerSync<cr>', 'Packer[S]ync' },
    i = { '<cmd>PackerInstall<cr>', 'Packer[I]nstall' },
    c = { '<cmd>PackerClean<cr>', 'Packer[C]lean' },
    e = { '<cmd>e ' .. vim.fn.stdpath('config') .. '/lua/plugins.lua' .. '<cr>', '[E]dit Plugin' },
  },
}, modes.n_leader)

-- Lsp Code
local lsp_buf = vim.lsp.buf
local lsp_module = {
  register_mappings = function(client, bufnr, opts)
    local buf_opts = modes.set_buf(modes.n, bufnr)
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
      key_register({ [opts.mapping] = { opts.fn, opts.desc, buffer = bufnr } }, opts.opts)
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
key_register({
  ['<m-h>'] = { tmux.resize_left, 'Resize WLeft' },
  ['<m-j>'] = { tmux.resize_bottom, 'Resize WBottom' },
  ['<m-k>'] = { tmux.resize_top, 'Resize WTop' },
  ['<m-l>'] = { tmux.resize_right, 'Resize WRight' },
}, modes.n)
key_register({
  ['['] = {
    name = '[Prev',
    t = { '<cmd>tabprevious<cr>', 'Previous [T]ab' },
    b = { '<cmd>bprevious<cr>', 'Previous [B]uffer' },
  },
  [']'] = {
    name = 'Next]',
    t = { '<cmd>tabnext<cr>', 'Next [T]ab' },
    b = { '<cmd>bnext<cr>', 'Next [B]uffer' },
  },
}, modes.n)
key_register({
  n = {
    name = '[N]ew',
    t = { '<cmd>tabnew<cr>', 'New [T]ab' },
    b = { '<cmd>enew<cr>', 'New [B]uffer' },
    w = {
      name = '[W]indows',
      ['\\'] = { '<cmd>wincmd v<cr>', 'New [V]ertical Window' },
      ['-'] = { '<cmd>wincmd s<cr>', 'New [H]orizontal Window' },
    },
  },
  q = {
    name = '[Q]uit',
    t = { '<cmd>tabclose<cr>', 'Quit [T]ab' },
    b = { '<cmd>bd!<cr><cmd>blast<cr>', 'Delete [B]uffer' },
    w = { '<cmd>wincmd q<cr>', 'Quit [W]indow' },
  },
}, modes.n_leader)

-- Terminal
local term_module = {
  register_mappings = function()
    local opts = {
      mode = 't',
      silent = true,
      buffer = 0,
    }
    key_register({
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
key_register({
  [','] = {
    name = 'Terminal',
    g = { term.new_cmd('lazygit'), 'Lazy[g]it' },
    d = { term.new_cmd('lazydocker'), 'Lazy[d]ocker' },
    s = { term.new_cmd('zsh'), '[S]hell' },
  },
}, modes.n_leader)

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
    local buf_opts = modes.set_buf(modes.n_leader, bufnr)
    key_register({
      g = {
        name = '',
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
          i = { '<cmd>Telescope goimpl<cr>', desc_format('[I]nterface') },
        },
        t = {
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
        -- Alias
        c = { run_test('test_func'), desc_format('[C]ursor') },
        i = { '<cmd>Telescope goimpl<cr>', desc_format('[I]nterface') },
        r = { require('go.lsp').hover_returns, desc_format('Variable [R]eturn') },
      },
    }, buf_opts)
  end,
}

-- |Test|
key_register({
  et = { function()
    local ns = vim.api.nvim_create_namespace('ns-test')
    vim.api.nvim_set_hl(ns, 'NodeCursor', {
      italic = true,
    })
  end, 'Test Feature' },
}, modes.n_leader)


return {
  lsp = lsp_module, -- Lsp Mapping Registration
  go = go_module, -- Go Mapping Registration
  term = term_module, -- Terminal Mapping Registration
}
