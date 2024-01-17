return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local highlight = { "iblScopeColor" }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "iblScopeColor", { fg = "#ae81ff" })
    end)

    require("ibl").setup({
      scope = { 
        enabled = true,
        highlight = highlight,
      },
    })

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}
