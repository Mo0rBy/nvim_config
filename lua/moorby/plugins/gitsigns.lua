return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function()
    local keymap = vim.keymap

    -- set keymap to toggle git blame
    -- if git blame is left on, it moves LSP notifications further to the right
    keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

    require("gitsigns").setup{}
  end
}
