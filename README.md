# Mo0rBy's neovim configuration

This neovim config is used by myself on a daily basis. This config uses lazy.nvim as the plugin manager and uses the lua language.

## Plugins

- [Lazy package manager](https://github.com/folke/lazy.nvim) - this plugin manager is required in order to install the remaining plugins
- [Monokai colorscheme](https://github.com/tanvirtin/monokai.nvim) - my preferred colorscheme, use a different one if you want to
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - a file explorer plugin, I prefer it over the default netrw plugin

    Has dependencies for:
    - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - better icons for filetypes

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Used for autocompletion snippets
    
    Has dependencies for:
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
    - [cmp-path](https://github.com/hrsh7th/cmp-path)
    - [LuaSnip](https://github.com/hrsh7th/cmp-path)
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
    - [lspkind](https://github.com/onsails/lspkind.nvim)

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides better syntax highlighting
