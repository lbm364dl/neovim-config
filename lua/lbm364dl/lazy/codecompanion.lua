return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "github/copilot.vim"
  },
  opts = {
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN,
            },
          })
        end,
      },
    },
    strategies = {
      chat = { adapter = "claude_code" },
      inline = { adapter = "claude_code" },
    },
  },
  -- opts = {
  --   strategies = {
  --     chat = {
  --       adapter = "copilot",
  --       model = "gpt-4.1"
  --     },
  --   },
  --   -- NOTE: The log_level is in `opts.opts`
  --   opts = {
  --     log_level = "DEBUG",
  --   },
  -- },
}
