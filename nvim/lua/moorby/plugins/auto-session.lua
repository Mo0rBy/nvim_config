return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Desktop" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for current working directory" })
    keymap.set("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for current working directory" })
  end
}
