local ns = require("null-ls")

ns.setup({
	sources = {
		-- ns.builtins.formatting.google_java_format,
		ns.builtins.formatting.stylua,
		ns.builtins.formatting.prettierd,
		ns.builtins.formatting.eslint_d,
		ns.builtins.diagnostics.eslint_d,
	},
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- 	end
	-- end,
})
