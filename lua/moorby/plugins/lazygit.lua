return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>gg", ":LazyGit<CR>")
  end
}
