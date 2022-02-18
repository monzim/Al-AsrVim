local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local all_source = {
	formatting.eslint,
	formatting.prettier,
	formatting.stylua,
	formatting.black, --Uncompromising Python code formatter. TODO: install pip install git+https://github.com/psf/black
	formatting.gofmt,
	formatting.shfmt,
	formatting.clang_format,
	formatting.cmake_format, --Format your listfiles nicely so that they don't look like crap.
	formatting.dart_format,
	formatting.codespell, --for code spelling TODO: INSTALL: pip install codespell
}

null_ls.setup({
	sources = all_source,

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
