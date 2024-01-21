# Mo0rBy's dotfiles

This repository contains files relevant to my development environment and other dotfiles that I want to to sync across multiple machines.

<!-- toc -->

- [Alacritty](#alacritty)
  * [Relevant files](#relevant-files)
- [Tmux](#tmux)
  * [Relevant files](#relevant-files-1)
  * [Plugins](#plugins)
- [Neovim](#neovim)
  * [Relevant files](#relevant-files-2)
  * [Plugins](#plugins-1)
    + [Quality of life](#quality-of-life)
    + [Colourscheme/themeing/UI modifications](#colourschemethemeingui-modifications)
    + [Syntax highlighting](#syntax-highlighting)
    + [Auto-completion features](#auto-completion-features)
    + [Git](#git)

<!-- tocstop -->

## Alacritty

I use [Alacritty](https://github.com/alacritty/alacritty) for my terminal needs. 
It's super fast and I love that all it's configuration and settings are set in a toml file

### Setup

Be aware that I had issues on my Linux Ubuntu machine.
When attempting to install alacritty with `apt install alacritty`, version 0.11.0 was installed, not the latest version (0.13.1 at time of writing).
This meant that my `alacritty.toml` config file was not used as this older version used a `yaml` file for it's config.

To ensure you have the latest version installed and that the `toml` config file works, follow [these](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) instructions on the Alacritty Github page.

### Relevant files

- [alacritty](alacritty)

## ZSH

I use ZSH as my shell of choice as it has really nice customization options using oh-my-zsh and I love the autocomplete features it comes with.

### Setup

1. You need to install ZSH by following the instructions provided on the [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) Github repo, [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
This should create some new files in your `$HOME` directory, namely the `.zshenv` and `.zshrc` files.

2. In order to use the ZSH configuration in this repo, you need to complete a few more steps.
Remove both `.zshenv` and `.zshrc` files that were generated when installing ZSH.
Next, symlink the `.zshenv` file: (this command assumes that this repo is cloned to `~/.config`, modify the command if required)
    ```sh
      ln -s ~/.config/zsh/.zshenv ~/.zshenv
    ```
    The `.zshenv` file in this repo contains some configuration that tells ZSH that the remaining config files are located in `$HOME/.config/zsh`.

    This repository has a git submodule for the oh-my-zsh repository and the included `.zshrc` has a line telling ZSH where the oh-my-zsh installation is located so there is no need to install it separately.

## Tmux

I use my terminal ALL the time. [Tmux](https://github.com/tmux/tmux) helps me to increase my productivity when in my terminal. The primary utility of Tmux is that it allows me to quickly switch between Neovim and a CLI terminal window.

### Setup

Install tmux using your preferred method.
I did not have any issues installing the latest version using the `apt` package manager like I did with alacritty.

To ensure that the `tmux/tmux.conf` file is loaded, open a tmux session and use the default keymap (`Ctrl+b`) and press `:` to enter the tmux command mode and execute `source-file ~/.config/tmux/tmux.conf` to load the config.
If the default `Ctrl+b` doesn't work, then try `Ctrl+a`, this is what I have it set to in my config.

Once the `tmux.conf` has been loaded for the first time, then you can use `Ctrl+a`, `r` to refresh the tmux config.

### Relevant files

- [tmux](tmux)

### Plugins

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - saves tmux windows & sessions when machine is restarted
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - continuously auto-saves the state of tmux (works nicely with tmux-resurrect)

## Neovim

Neovim is an evolution of vi and vim. You can install many different plugins to make Neovim look and feel exactly as you want. I use it as my main code editor.

### Relevant files

- [nvim](nvim)

### Plugins

This is a list of all the plugins I use in my Neovim config.

#### Quality of life

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - adds useful keymaps for navigating splits within vim and tmux
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - a fuzzy finder plugin making it easier to find open buffers as well as files and text across directories, this has dependencies for:
    - [plenary](https://github.com/nvim-lua/plenary.nvim) - adds extra lua functions
    - [ripgrep](https://github.com/BurntSushi/ripgrep) - a tool that can recursively search across directories for a regex pattern
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - this plugin will highlight other instances of a word that the cursor is on
- [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) - this plugin highlights what was just yanked (copied)
- [vim-maximizer](https://github.com/szw/vim-maximizer) - used to maximize (and return to normal) a split
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - makes it easier to see indentation (my configuration uses the `scope` too)
- [comment](https://github.com/numToStr/Comment.nvim) - used for better commenting functionality, this has dependencies for:
    - [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - used for better commenting in files with multiple comment formats
- [vim-surround](https://github.com/tpope/vim-surround) - adds useful keymaps to modify textobject surroundings

#### Colourscheme/themeing/UI modifications

- [Tokyonight colorscheme](https://github.com/folke/tokyonight.nvim) - my preferred colorscheme, use a different one if you want to (note that the tokyonight repo contains configs for alacritty and tmux, so I use those too)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - a file explorer plugin, I prefer it over the default netrw plugin
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - better icons for filetypes
- [dressing](https://github.com/stevearc/dressing.nvim) - modifies some UI elements for example, adding/renaming files in nvim-tree or inputs for LSP renaming
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - adds a status line

#### Syntax highlighting

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides better syntax highlighting, this has dependencies for:
    - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - autoclose and autorename html tags
- [vim-ployglot](https://github.com/sheerun/vim-polyglot) - this plugin is a language pack that adds syntax highlighting support for ~150 more languages. This includes adding `helm` filetypes which is one of the reasons I use it
- [tree-sitter-go-tempalte](https://github.com/ngalaiko/tree-sitter-go-template) - adds syntax highlighting for Go template filetypes

#### Auto-completion features

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - used for autocompletion snippets, this has dependencies for:
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - completion source from text in current buffer
    - [cmp-path](https://github.com/hrsh7th/cmp-path) - completion source from filesystem paths
    - [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - a snippet engine
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - completion source from snippet engines
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - snippets for various languages
    - [lspkind](https://github.com/onsails/lspkind.nvim) - nice icons for autocompletion
- [mason](https://github.com/williamboman/mason.nvim) - this is a plugin manager for LSP servers, this has dependencies for:
    - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - this plugin makes it easier to use lspconfig with Mason 
- [lspconfig](https://github.com/neovim/nvim-lspconfig) - this plugin allows setup and configuration of LSP servers

#### Git

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - adds git integration to buffers so you can see git changes + git blame etc

