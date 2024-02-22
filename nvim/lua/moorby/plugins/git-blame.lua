return {
  "f-person/git-blame.nvim",
  lazy = false,
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame information" })
  end
}
