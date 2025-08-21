return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	-- build = "make install_jsregexp"
	config = function()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/lbm364dl/luasnippets" }

		luasnip.setup({
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
			updateevents = "TextChanged,TextChangedI"
		})

		-- Insert mode: expand snippet or jump
		vim.keymap.set("i", "jk", function()
			if luasnip.expand_or_jumpable() then
				return "<Plug>luasnip-expand-or-jump"
			else
				return "jk"
			end
		end, { expr = true, silent = true })

		-- Select mode (visual): jump to next placeholder
		vim.keymap.set("s", "jk", function()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
				return "<Plug>luasnip-jump-next"
			else
				return "jk"
			end
		end, { expr = true, silent = true })

		-- Optional: jump backward in insert/select mode
		vim.keymap.set({ "i", "s" }, "kj", function()
			if luasnip.jumpable(-1) then
				return "<Plug>luasnip-jump-prev"
			else
				return "kj"
			end
		end, { expr = true, silent = true })
	end
}
