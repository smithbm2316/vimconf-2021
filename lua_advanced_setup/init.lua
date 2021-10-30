-- make sure that globals.lua is required first, as we want to use the
-- functions and helpers we add there EVERYWHERE in our configuration
require 'globals'

-- everything else here, the order *shouldn't* matter as much I prefer to put
-- plugins as far towards the end of my require statements so that if you
-- introduce a bug on accident, its likely that the rest of your config works
-- fine other than some plugin configuration that is going awry
require 'settings'
require 'plugins'
require 'mappings'
require 'autocmds'
