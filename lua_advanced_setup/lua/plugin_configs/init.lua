local plugin_config_files = vim.fn.globpath('~/.config/nvim/lua/plugin_configs', '*.lua', false, true)

for _, plugin_config_path in ipairs(plugin_config_files) do
  local plugin = plugin_config_path:gsub('.+/', ''):sub(0, -5)
  if plugin ~= 'init' then
    require('plugin_configs.' .. plugin)
  end
end
