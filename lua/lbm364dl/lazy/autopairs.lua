return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- lazy-load on insert mode
	config = function()
		require("nvim-autopairs").setup {
			check_ts = true, -- use treesitter for smarter pairing
			fast_wrap = {},  -- optional fast wrap
			disable_filetype = { "TelescopePrompt", "spectre_panel", "quarto" },
		}

		-- integrate with nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
}
