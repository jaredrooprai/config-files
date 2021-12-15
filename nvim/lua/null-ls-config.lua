require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.eslint_d,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre *.tsx,*.ts,*.lua lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
