--[[
-- settings
--]]
vim.cmd 'syntax on'
vim.cmd 'filetype plugin indent on'
vim.g.mapleader = ' '
vim.g.vimsyn_embed = 'lPr'

vim.o.autoindent = true
vim.o.completeopt = 'menu,menuone,noinsert'
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.foldmethod = 'manual'
vim.opt.formatoptions:append('jnrql')
vim.opt.formatoptions:remove('2tac')
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.mouse = 'n'
vim.o.number = true
vim.o.path = '.,**'
vim.o.relativenumber = true
vim.o.shiftwidth=2
vim.opt.shortmess:append('c')
vim.o.showtabline = 1
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop=2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop=2
vim.o.termguicolors = true
vim.o.wildignore = '*/node_modules/*,*/.git/*,DS_Store,*/venv/*,*/__pycache__/*,*.pyc'
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wildoptions = 'pum'
vim.o.wrap = false



--[[
-- plugins
--]]
require('packer').startup(function(use)
  -- telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- builtin lsp
  use 'neovim/nvim-lspconfig'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- auto-completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  -- comments
  use 'numToStr/Comment.nvim'

  -- comments integration with treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- lua development
  use 'folke/lua-dev.nvim'

  -- nerd font icons :D
  use 'kyazdani42/nvim-web-devicons'

  -- statusline
  use 'shadmansaleh/lualine.nvim'

  -- file manager
  use 'tamago324/lir.nvim'

  -- snippets engine
  use 'L3MON4D3/LuaSnip'

  -- theme
  use 'rose-pine/neovim'

  -- lsp diagnostics
  use 'folke/trouble.nvim'

  -- vimscript plugins
  use 'milisims/nvim-luaref'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'christoomey/vim-system-copy'
end)



--[[
-- colorscheme
--]]
vim.g.rose_pine_variant='moon'
vim.cmd 'colorscheme rose-pine'



--[[
-- autocmds
--]]
-- highlight yank for a brief second for visual feedback
vim.cmd 'autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }'



--[[
-- remaps
--]]
-- remap Y to yank to end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('v', 'Y', 'y$', { noremap = true })

-- delete text without yanking
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', { noremap = true })

-- turn off search highlighting
vim.api.nvim_set_keymap('n', '<leader>hl', ':nohlsearch<cr>', { noremap = true })

-- neovim terminal can exit to normal mode with <esc> now
vim.api.nvim_set_keymap('t', '<esc>', [[ <c-\><c-n> ]], { noremap = true })

-- swap between light and dark themes for rose-pine (Toggle Theme)
vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>lua require('rose-pine.functions').toggle_variant({ 'moon', 'dawn' })<cr>]], { noremap = true })
