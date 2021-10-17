-- remap Y to yank to end of line
nnoremap('Y', 'y$')
vnoremap('Y', 'y$')

-- delete text without yanking
nnoremap('<leader>d', '"_d')
vnoremap('<leader>d', '"_d')

-- turn off search highlighting
nnoremap('<leader>hl', ':nohlsearch<cr>')

-- neovim terminal can exit to normal mode with <esc> now
tnoremap('<esc>', [[<c-\><c-n>]])

-- swap between light and dark themes for rose-pine (Toggle Theme)
nnoremap('<leader>tt', [[<cmd>lua require('rose-pine.functions').toggle_variant({ 'moon', 'dawn' })<cr>]])
