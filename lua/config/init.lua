local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.globals") -- Sets vim.mapleader option
require("config.keymaps")
require("config.options")

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "monokai" }
	},
	rtp = {
	disabled_plugins = {
		"gzip",
		"matchit",
		"matchparen",
    "netrw",
		"netrwPlugin",
		"tarPlugin",
		"tohtml",
		"tutor",
		"zipPlugin",
	}
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
}

require("lazy").setup(
  {
    {import = "plugins"},
    {import = "plugins.lsp"}
  },
  opts
)
