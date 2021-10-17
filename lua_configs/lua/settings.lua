-- aliases for Lua API functions we will use a lot!
local opt = vim.opt
local o = vim.o

-- settings
vim.cmd [[
syntax on
filetype plugin indent on
]]
vim.g.mapleader = ' '
vim.g.vimsyn_embed = 'lPr'

o.autoindent = true
o.completeopt = 'menu,menuone,noinsert'
o.errorbells = false
o.expandtab = true
o.foldmethod = 'manual'
opt.formatoptions:append('jnrql')
opt.formatoptions:remove('2tac')
o.hidden = true
o.ignorecase = true
o.inccommand = 'split'
o.incsearch = true
o.laststatus = 2
o.lazyredraw = true
o.mouse = 'n'
o.number = true
o.path = '.,**'
o.relativenumber = true
o.shiftwidth=2
opt.shortmess:append('c')
o.showtabline = 1
o.signcolumn = 'yes'
o.smartcase = true
o.smartindent = true
o.softtabstop=2
o.splitbelow = true
o.splitright = true
o.tabstop=2
o.termguicolors = true
o.wildignore = '*/node_modules/*,*/.git/*,DS_Store,*/venv/*,*/__pycache__/*,*.pyc'
o.wildmenu = true
o.wildmode = 'full'
o.wildoptions = 'pum'
o.wrap = false

-- colorscheme
vim.g.rose_pine_variant='moon'
vim.cmd 'colorscheme rose-pine'
