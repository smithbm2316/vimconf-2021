-- quickly print a lua table to :messages
_G.dump = function(...)
  print(vim.inspect(...))
end

-- wrapper for nvim_set_keymap with sensible defaults
local keymapper = function(mode, lhs, rhs, override_opts, bufnr)
  -- set default options
  local opts = { noremap = true, silent = true }
  local buf_local = false

  -- if the user wants a buffer_local mapping, take note
  -- because we have to use nvim_buf_set_keymap instead
  if override_opts then
    if override_opts.buffer then
      -- remove buffer key from override_opts table
      override_opts.buffer = nil
      buf_local = true
    end
    -- extend the default options with user's overrides
    vim.tbl_extend('keep', override_opts, opts)
  end

  -- set a buffer-local mapping
  if buf_local then
    vim.api.nvim_buf_set_keymap(bufnr or 0, mode, lhs, rhs, opts)
    -- set a regular global mapping
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

-- set a key mapping for normal mode
_G.nnoremap = function(lhs, rhs, opts, bufnr)
  keymapper('n', lhs, rhs, opts, bufnr)
end
-- set a key mapping for insert mode
_G.inoremap = function(lhs, rhs, opts, bufnr)
  keymapper('i', lhs, rhs, opts, bufnr)
end
-- set a key mapping for visual mode
_G.vnoremap = function(lhs, rhs, opts, bufnr)
  keymapper('v', lhs, rhs, opts, bufnr)
end
-- set a key mapping for command-line mode
_G.cnoremap = function(lhs, rhs, opts, bufnr)
  keymapper('c', lhs, rhs, opts, bufnr)
end
-- set a key mapping for terminal mode
_G.tnoremap = function(lhs, rhs, opts, bufnr)
  keymapper('t', lhs, rhs, opts, bufnr)
end
-- set a key mapping for operator-pending mode
_G.onoremap = function(lhs, rhs, opts, bufnr)
  keymapper('o', lhs, rhs, opts, bufnr)
end
-- set a key mapping for insert and command-line mode
_G.icnoremap = function(lhs, rhs, opts, bufnr)
  keymapper('!', lhs, rhs, opts, bufnr)
end
