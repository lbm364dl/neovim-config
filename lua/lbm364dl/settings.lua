vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme("tokyonight")
vim.opt.relativenumber = true

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
	
	
