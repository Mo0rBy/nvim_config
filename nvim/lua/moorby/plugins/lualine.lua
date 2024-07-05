return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup{
      options = {
        theme = "molokai",
      },
      sections = {
        lualine_c = {
          "buffers"
        }
      }
    }
  end
}
