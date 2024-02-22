return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    require("blame").setup({
      merge_consecutive = true,
      date_format = "%d/%m/%Y %H:%M"
    })
  end
}
