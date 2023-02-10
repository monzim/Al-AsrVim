local setColorScheme = "onedark"

-- onedark gruvbox moonfly
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. setColorScheme)
if not status_ok then
	vim.notify("colorscheme " .. setColorScheme .. " not found!")
	return
end


