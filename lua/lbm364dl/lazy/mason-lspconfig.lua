return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "r_language_server", "air", "ruff", "pyright" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
