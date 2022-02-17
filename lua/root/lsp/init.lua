local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("root.lsp.lsp-installer")
require("root.lsp.handlers").setup()
require ("root.lsp.null-ls")
-- require("flutter-tools").setup{}
require("root.lsp.flutter")