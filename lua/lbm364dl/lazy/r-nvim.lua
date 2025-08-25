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
  },
}
