" settings
syntax on
filetype plugin indent on
let mapleader = ' '
let g:vimsyn_embed = 'lPr'

set autoindent
set completeopt=menu,menuone,noinsert
set expandtab
set foldmethod=manual
set formatoptions+=jnrql
set formatoptions-=2tac
set hidden
set ignorecase
set inccommand=split
set incsearch
set laststatus=2
set lazyredraw
set mouse=n
set number
set noerrorbells
set norelativenumber
set nowrap
set path+=.,**
set shiftwidth=2
set shortmess+=c
set showtabline=1
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set wildignore+=*/node_modules/*,*/.git/*,.DS_Store,*/venv/*,*/__pycache__/*,*.pyc
set wildmenu
set wildmode=full
set wildoptions=pum




" plugins
call plug#begin('~/.config/nvim/plugged')
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

" builtin lsp
Plug 'neovim/nvim-lspconfig'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" auto-completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'

" comments
Plug 'numToStr/Comment.nvim'

" comments integration with treesitter
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" lua development
Plug 'folke/lua-dev.nvim'

" nerd font icons :D
Plug 'kyazdani42/nvim-web-devicons'

" statusline
Plug 'shadmansaleh/lualine.nvim'

" file manager
Plug 'tamago324/lir.nvim'

" snippets engine
Plug 'L3MON4D3/LuaSnip'

" theme
Plug 'rose-pine/neovim'

" lsp diagnostics
Plug 'folke/trouble.nvim'

" vimscript plugins
Plug 'milisims/nvim-luaref'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-system-copy'
call plug#end()



" colorscheme
let g:rose_pine_variant='moon'
colorscheme rose-pine



" autocmds
autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }



" remaps
" remap Y to yank to end of line
nnoremap Y y$
vnoremap Y y$

" delete text without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" turn off search highlighting
nnoremap <leader>hl :nohlsearch<cr>

" neovim terminal can exit to normal mode with <esc> now
tnoremap <esc> <c-\><c-n>

" swap between light and dark themes for rose-pine (Toggle Theme)
nnoremap <leader>tt <cmd>lua require('rose-pine.functions').toggle_variant({ 'moon', 'dawn' })<cr>
