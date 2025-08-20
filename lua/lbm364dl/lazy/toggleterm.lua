return {
  "akinsho/nvim-toggleterm.lua",
  lazy = false,
  config = function()
    require("toggleterm").setup{
      size = 20,                  -- height of horizontal terminal, or width if vertical
      open_mapping = [[<c-\>]],    -- keymap to toggle terminal
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",         -- options: "horizontal", "vertical", "tab", "float"
      float_opts = {
        border = "curved",         -- style of the floating window border
        winblend = 0,
        highlights = { border = "Normal", background = "Normal" },
      },
    }
  end
}
