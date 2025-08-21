return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		-- Normal mode: toggle comment with <leader>/
		vim.keymap.set("n", "<leader>/", function()
			return vim.api.nvim_get_vvar("count") == 0
					and "<Plug>(comment_toggle_linewise_current)"
					or "<Plug>(comment_toggle_linewise_count)"
		end, { expr = true, silent = true })

		-- Visual mode: toggle comment on selection with <leader>/
		vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
	end,
}
