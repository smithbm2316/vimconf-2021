return require('packer').startup(function(use)
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
