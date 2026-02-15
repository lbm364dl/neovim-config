local M = {}

function M.in_mathzone()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before_cursor = line:sub(1, col)
  
  -- Fallback: Check if we are immediately after $ or $$ (syntactic math start)
  -- This is useful for autosnippets where TS might not have updated yet or for immediate expansion
  if before_cursor:match("%$$") then
    return true
  end

  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()
  while node do
    if node:type() == "inline_formula" or node:type() == "math_block" or node:type() == "displayed_equation" or node:type() == "latex_block" or node:type() == "inline_equation" or node:type() == "block_equation" then
      return true
    end
    node = node:parent()
  end
  return false
end

function M.is_after_latex_command()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  -- get text before cursor. strict handling might require adjusting col based on trigger length if called inside snippet logic
  -- but generally for the condition check, we want to look immediately behind the trigger.
  local before_cursor = line:sub(1, col)
  return before_cursor:match("\\[a-zA-Z]+$") ~= nil
end

return M
