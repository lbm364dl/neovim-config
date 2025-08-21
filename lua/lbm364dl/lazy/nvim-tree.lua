return {
  "nvim-tree/nvim-tree.lua",
  opts = {},
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
      	local api = require("nvim-tree.api")

      	-- default mappings
      	api.config.mappings.default_on_attach(bufnr)

      	-- custom mappings (buffer-local!)
      	vim.keymap.set("n", "l", api.node.open.edit, {desc = "nvim-tree: Open file"})
			end
    })
  end,
  keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
  }
}
