return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup{
      options = {
        theme = require("lualine.themes.molokai"),
        globalstatus = true
      },
    }
  end
}
