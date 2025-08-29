vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme("tokyonight")
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.undofile = true
-- Case insensitive searching
vim.opt.ignorecase = true
-- BUT: if you type a capital letter, make it case-sensitive
vim.opt.smartcase = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "r", "typescript", "lua", "yaml", "json", "html", "css" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

vim.diagnostic.config({
	virtual_text = true,     -- show inline messages
	signs = true,            -- show gutter signs
	underline = true,        -- underline problematic code
	update_in_insert = false, -- don’t update while typing
})
