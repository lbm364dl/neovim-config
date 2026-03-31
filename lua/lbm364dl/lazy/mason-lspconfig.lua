return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "ruff", "pyright", "lua_ls", "elixirls", "ts_ls" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
