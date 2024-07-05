return {
  "rcarriga/nvim-notify",
  lazy = false,
  priority = 1000,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Use plugin for all default notifications
    vim.notify = require("notify")

    -- Set plugin configuration options
    vim.notify.setup({
      render = "compact",
    })
  end
}
