local v = vim

v.lsp.handlers["textDocument/hover"] = v.lsp.with(v.lsp.handlers.hover, {
	border = "rounded",
})
