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
vim.opt.formatoptions:append 'jnrql'
vim.opt.formatoptions:remove '2tac'
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
vim.o.shiftwidth = 2
vim.opt.shortmess:append 'c'
vim.o.showtabline = 1
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wildignore = '*/node_modules/*,*/.git/*,DS_Store,*/venv/*,*/__pycache__/*,*.pyc'
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wildoptions = 'pum'
vim.o.wrap = false

-- [[
-- for me, not you!
-- ]]
vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd [[set packpath=/tmp/nvim/site]]

local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
local fn = vim.fn
if fn.empty(fn.glob(install_path)) > 0 then
  print 'installing packer...'
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'done!!'
end

--[[
-- plugins
--]]
-- check packer's docs for more details on how to bootstrap
-- https://github.com/wbthomason/packer.nvim
require('packer').startup {
  function(use)
    -- manage packer with packer :0
    use 'wbthomason/packer.nvim'
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

    -- comments
    use 'numToStr/Comment.nvim'
    -- nerd font icons :D
    use 'kyazdani42/nvim-web-devicons'

    -- statusline
    use 'shadmansaleh/lualine.nvim'

    -- theme
    use {
      'rose-pine/neovim',
      config = function()
        --[[
        -- colorscheme
        --]]
        vim.g.rose_pine_variant = 'moon'
        vim.cmd 'colorscheme rose-pine'
      end,
    }

    -- vimscript plugins
    use 'milisims/nvim-luaref'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'christoomey/vim-system-copy'
  end,
  config = {
    package_root = package_root,
    compile_path = install_path .. '/plugin/packer_compiled.lua',
  },
}

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
vim.api.nvim_set_keymap(
  'n',
  '<leader>tt',
  [[<cmd>lua require('rose-pine.functions').toggle_variant({ 'moon', 'dawn' })<cr>]],
  { noremap = true }
)

-- these are for my sanity :)
vim.api.nvim_set_keymap('n', '<leader>fj', [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gl', [[<c-^>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'go', [[:]], { noremap = true })
