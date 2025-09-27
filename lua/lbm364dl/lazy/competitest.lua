return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup()

    -- Competitest key bindings
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>QT", ":CompetiTest run<CR>", opts)
    map("n", "<leader>QQ", ":CompetiTest add_testcase<CR>", opts)
    map("n", "<leader>QE", ":CompetiTest edit_testcase ", opts)
    map("n", "<leader>QP", ":CompetiTest receive problem<CR>", opts)
    map("n", "<leader>QC", ":CompetiTest receive contest<CR>", opts)
    map("n", "<leader>QF", "ggyG<C-o>", opts)
  end,
}
