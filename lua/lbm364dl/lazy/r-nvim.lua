local function run_current_testthat()
  local buf = 0

  -- get path of current buffer
  local cur_file = vim.api.nvim_buf_get_name(buf)
  if cur_file == "" then
    vim.notify("No file detected", vim.log.levels.WARN)
    return
  end
  local file_dir = vim.fn.fnamemodify(cur_file, ":h")

  -- jump backwards to nearest "test_that("
  local start_line = vim.fn.search([[\s*test_that\s*(]], "bnW")
  if start_line == 0 then
    vim.notify("No enclosing test_that() found", vim.log.levels.WARN)
    return
  end

  vim.api.nvim_win_set_cursor(0, { start_line, 9999 })

  -- jump forward to matching "}" (balance-aware)
  local end_line = vim.fn.searchpair("{", "", "}", "nW", "")
  if end_line == 0 then
    vim.notify("Could not find closing brace for test_that()", vim.log.levels.WARN)
    return
  end

  -- grab lines from start to end (0-indexing and right-open internal, i.e. [start_line-1, end_line-1])
  local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)

  -- write to tmp file
  local tmpfile = file_dir .. "/.tmp_testthat_block.R"
  vim.fn.writefile(lines, tmpfile)

  local cmd = string.format([[
  {
    tmpfile <- '%s'
    testthat::test_file(tmpfile)
    unlink(tmpfile)
  }
  ]], tmpfile)

  -- send to R
  require("r.send").cmd(cmd)
end

vim.keymap.set("n", "<localleader>t", run_current_testthat,
  { desc = "Run enclosing test_that() with testthat::test_file" })

return {
  "R-nvim/R.nvim",
  -- Only required if you also set defaults.lazy = true
  lazy = false,
  keys = {
    {
      "<localleader>rl",
      function() require("r.send").cmd("devtools::load_all()") end,
      mode = "n",
      ft = "r",
      desc = "R devtools::load_all()",
    },
    {
      "<localleader>rt",
      run_current_testthat,
      mode = "n",
      ft = "r",
      desc = "R run testthat test",
    },
  },
}
