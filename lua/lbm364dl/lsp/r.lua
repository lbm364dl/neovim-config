-- Don't use formatting from r_language_server, use air LSP for that
vim.lsp.config('r_language_server', {
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
})

vim.lsp.enable('r_language_server')
vim.lsp.enable('air')
