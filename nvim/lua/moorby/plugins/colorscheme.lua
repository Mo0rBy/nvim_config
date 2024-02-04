return {
  "tanvirtin/monokai.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("monokai").setup({
      palette = {
        base2 = "#262626" -- change background colour to same used in Alacritty config
      }
    })
  end
}
