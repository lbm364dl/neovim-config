vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "hj", "<Esc>", { desc = "Leave insert mode" })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close current buffer " })

vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format({ async = true }) -- async formatting
end, { desc = "Format current buffer" })

-- If diagnostics floating window is too large, you can go inside with <C-w> w after opening it
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic" })
