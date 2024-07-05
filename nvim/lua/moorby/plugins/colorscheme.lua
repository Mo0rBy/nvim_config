-- Catpucin Mocha colours
-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha"
--     })
--
--     vim.cmd.colorscheme "catppuccin"
--   end
-- }

-- Tokyonight Night colours
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "moon"
    })

    vim.cmd.colorscheme "tokyonight"
  end
}
