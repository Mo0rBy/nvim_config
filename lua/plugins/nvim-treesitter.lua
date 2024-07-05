local config = function()
  require("nvim-treesitter.configs").setup({
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "bash",
      "lua",
      "luadoc",
      "dockerfile",
      "gitignore",
      "python",
      "vue",
      "groovy",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "comment",
      "diff",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "hcl",
      "hjson",
      "java",
      "jq",
      "kconfig",
      "properties",
      "regex",
      "rego",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
