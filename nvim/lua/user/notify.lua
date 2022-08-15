local status_ok, notification_manager = pcall(require, "notify")
if not status_ok then
  vim.notify("Cannot run correctly notify")
	return
end

notification_manager.setup()

-- setup nvim notify by default
vim.notify = notification_manager

-- telescope extension
require("telescope").load_extension("notify")
