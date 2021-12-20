-- autoinstall packer.nvim if not already installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

-- make sure that globals.lua is required first, as we want to use the
-- functions and helpers we add there EVERYWHERE in our configuration
require 'globals'

-- everything else here, the order *shouldn't* matter as much I prefer to put
-- plugins as far towards the end of my require statements so that if you
-- introduce a bug on accident, its likely that the rest of your config works
-- fine other than some plugin configuration that is going awry
require 'settings'
require 'plugins'
require 'plugin_configs'
require 'mappings'
require 'autocmds'
