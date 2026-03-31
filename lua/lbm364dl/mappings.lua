vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "hj", "<Esc>", { desc = "Leave insert mode" })

vim.keymap.set("n", "<leader>c", function()
  if vim.bo.modified then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Save?", "&Yes\n&No\n&Cancel", 1)
    if choice == 1 then
      vim.cmd("write")
      vim.cmd("bdelete")
    elseif choice == 2 then
      vim.cmd("bdelete!")
    else
      return
    end
  else
    vim.cmd("bdelete")
  end
end, { desc = "Close current buffer" })

-- Open nvim-tree and focus on the current file
vim.keymap.set("n", "<leader>e", function()
  -- Open nvim-tree and focus on the current file
  require("nvim-tree.api").tree.toggle({ focus = true, find_file = true })
end, { desc = "Toggle file explorer" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<CR>:b<space>", { desc = "List buffers" })

vim.keymap.set("n", "<leader>vc", "<cmd>vsplit $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>vm", "<cmd>vsplit ~/.config/nvim/lua/lbm364dl/mappings.lua<CR>", { desc = "Edit mappings" })

vim.keymap.set("n", "<leader>lf", function()

if vim.bo.filetype == "quarto" then
  require("conform").format()
else
  vim.lsp.buf.format({ async = true }) -- async formatting
end

end, { desc = "Format current buffer" })

vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })

-- If diagnostics floating window is too large, you can go inside with <C-w> w after opening it
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic" })
