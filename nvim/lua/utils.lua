local plugin_loaded = 0

function _SAFE_LOAD_PLUGIN(plugin_name)
  local status_ok, plugin_ready = pcall(require, plugin_name)

  if not status_ok then
    vim.notify("Cannot load " .. plugin_name, "error", { title = "Plugin boot"})
    return
  else
    plugin_loaded = plugin_loaded + 1
    -- vim.notify("Loaded correctly " .. plugin_name, "info", { title = "Plugin boot"})
  end

  return plugin_ready
end

function _PLUGIN_LOADED()
  return plugin_loaded
end
