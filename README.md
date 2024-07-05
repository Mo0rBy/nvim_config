# Mo0rBy's dotfiles

This repository contains files relevant to my development environment and other dotfiles that I want to to sync across multiple machines.

<!-- toc -->

- [Tmux](#tmux)
  * [Relevant files](#relevant-files)
- [Neovim](#neovim)
  * [Relevant files](#relevant-files-1)
  * [Plugins](#plugins)
    + [Quality of life](#quality-of-life)
    + [Colourscheme/themeing/UI modifications](#colourschemethemeingui-modifications)
    + [Syntax highlighting](#syntax-highlighting)
    + [Auto-completion features](#auto-completion-features)
    + [Git](#git)
  * [Notes](#notes)
    + [Yaml and Helm chart sytanx highlighting and LSP](#yaml-and-helm-chart-sytanx-highlighting-and-lsp)

<!-- tocstop -->

## Tmux

I use my terminal ALL the time. [Tmux](https://github.com/tmux/tmux) helps me to increase my productivity when in my terminal. The primary utility of Tmux is that it allows me to quickly switch between Neovim and a CLI terminal window.

### Relevant files

- [tmux/tmux.conf](tmux/tmux.conf)

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

#### Colourscheme/themeing/UI modifications

- [Nightfly colorscheme](https://github.com/bluz71/vim-nightfly-colors) - my preferred colorscheme, use a different one if you want to
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
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
    - [cmp-path](https://github.com/hrsh7th/cmp-path)
    - [LuaSnip](https://github.com/hrsh7th/cmp-path)
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
    - [lspkind](https://github.com/onsails/lspkind.nvim) - integrate installed LSP's with autocompletion
- [mason](https://github.com/williamboman/mason.nvim) - this is a plugin manager for LSP servers, this has dependencies for:
    - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - this plugin makes it easier to use lspconfig with Mason 
- [lspconfig](https://github.com/neovim/nvim-lspconfig) - this plugin allows setup and configuration of LSP servers

#### Git

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - adds git integration to buffers so you can see git changes + git blame etc

### Notes

#### Yaml and Helm chart sytanx highlighting and LSP

As I am a DevOps Engineer / Site Reliability Engineer, I do a lot of work with Kubernetes yaml and Helm charts.
While setting up this config, I had quite a bit of trouble getting LSP and syntax highlighting working for both yaml files and Helm chart files.

TODO: Edit this section to be more up-to-date with fixing LSP in Helm chart development.

First I'll talk more about the LSP configuration.
I use the `yamlls` LSP and in Helm charts, this LSP goes crazy, errors on every single line.
This makes sense because Helm chart yaml files are not true yaml.
To stop this from happening, I have used the `vim-helm` plugin.
This plugin is super simple and just adds a new `helm` filetype if the yaml file appears in a `templates` directory or has some other filetype prefixes associated with Helm charts.
Here is the regex that is used in this plugin: `*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml`

With this new `helm` filetype, you can disable the `yamlls` LSP server if vim/nvim detects this filetype.
Refer to the `lua/moorby/core/plugins/lsp/lspconfig.lua` file in this repo.
Here is the lua code that disables the `yamlls` LSP on `helm` files:

```lua
lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr) -- run the standard on_attach function defined above

    -- disable yamlls Diagnostics on helm files (this is dependent on "towolf/vim-helm")
    -- without this the yamlls LSP server will show loads of errors in helm chart repositories
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable()
    end
  end
})
```

This only fixes LSP for `helm` files, not syntax highlighting.
For this, you need to install a "go template treesitter parser".
[This](https://github.com/ngalaiko/tree-sitter-go-template) is the treesitter parser that I use in this config.
There are instructions on the Github page to install this parser.
Follow the instructions there to install and setup the `gotmpl` parser and then make 1 small change.
This uses the `vim-helm` plugin again to get the new `helm` filetype.
In the `gotmpl` parser config, change the `used_by` setting to this:

```lua
used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "helm"}
```

As you can see, you just swap out `yaml` for `helm` and the syntax highlighting on Helm charts is fixed (hallelujah!)

I'm still trying to get `helm_ls` LSP to work in Helm chart files as it should, I'm not exactly sure what is is I am doing incorrecetly, but I'm not getting any LSP within Helm chart files.
