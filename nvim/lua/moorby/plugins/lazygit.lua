return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  -- optional for floating window border decoration
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")
  end
}
