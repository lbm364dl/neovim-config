return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		bufferline = require("bufferline")
		bufferline.setup {
			options = {
				numbers = "none", -- can also use "ordinal" or "buffer_id"
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = { style = "icon", icon = "▎" },
				buffer_close_icon = "",
				modified_icon = "●",
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				separator_style = "slant", -- or "thick", "thin", "slant"
			}
		}

		vim.keymap.set("n", "<leader>bj", function()
			bufferline.pick_buffer()
		end, { desc = "Pick buffer by letter" })
	end
}
