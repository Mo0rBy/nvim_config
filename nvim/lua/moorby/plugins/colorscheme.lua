return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night", -- set the 'night' style

      -- set custom colors
      on_colors = function(colors)
        local gitDeleteRed = "#D41501"

        -- colors for gitSigns plugin
        colors.gitSigns = {
          add = colors.green,
          change = colors.orange,
          delete = gitDeleteRed
        }

        -- colors for git
        colors.git = {
          add = colors.green,
          change = colors.orange,
          delete = gitDeleteRed
        }
      end

    })

    vim.cmd("colorscheme tokyonight")
  end
}
