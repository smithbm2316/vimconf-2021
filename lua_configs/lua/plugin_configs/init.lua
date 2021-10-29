local plugin_config_root = 'plugin_configs.'
local plugin_config_files = vim.fn.globpath('lua/my/plugs', '*.lua')

for plugin_name in plugin_config_files:gmatch('([%w%d-_]+).lua') do
  require(plugin_config_root .. plugin_name)
end
