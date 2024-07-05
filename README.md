# Mo0rBy's neovim configuration

This neovim config is used by myself on a daily basis. This config uses lazy.nvim as the plugin manager and uses the lua language.

## Plugins

- [Lazy package manager](https://github.com/folke/lazy.nvim) - this plugin manager is required in order to install the remaining plugins
- [Monokai colorscheme](https://github.com/tanvirtin/monokai.nvim) - my preferred colorscheme, use a different one if you want to
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - a file explorer plugin, I prefer it over the default netrw plugin, this has dependencies for:
    - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - better icons for filetypes
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - used for autocompletion snippets, this has dependencies for:
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
    - [cmp-path](https://github.com/hrsh7th/cmp-path)
    - [LuaSnip](https://github.com/hrsh7th/cmp-path)
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
    - [lspkind](https://github.com/onsails/lspkind.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides better syntax highlighting, this has dependencies for:
    - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - autoclose and autorename html tags
- [comment](https://github.com/numToStr/Comment.nvim) - used for better commenting functionality, this has dependencies for:
    - [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - used for better commenting in files with multiple comment formats
- [vim-maximizer](https://github.com/szw/vim-maximizer) - used to maximize (and return to normal) a split
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - makes it easier to see indentation (my configuration uses the `scope` too)
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - adds a status line, this has dependencies for:
    - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - better icons for filetypes
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - a fuzzy finder plugin making it easier to find open buffers as well as files and text across directories, this has dependencies for:
    - [plenary](https://github.com/nvim-lua/plenary.nvim) - adds extra lua functions
    - [ripgrep](https://github.com/BurntSushi/ripgrep) - a tool that can recursively search across directories for a regex pattern
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - this plugin will highlight other instances of a word that the cursor is on
- [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) - this plugin highlights what was just yanked (copied)
