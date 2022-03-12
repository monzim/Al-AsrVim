local status_ok, flutter = pcall(require, "flutter-tools")
if not status_ok then
	print("Flutter tools plugin failed!")
	return
end

vim.cmd([[ command! Flttool execute 'lua require("telescope").extensions.flutter.commands()' ]])
vim.cmd([[ command! FltFvm execute 'lua require("telescope").extensions.flutter.fvm()']])

flutter.setup({
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = true,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = true,
		},
	},
})
