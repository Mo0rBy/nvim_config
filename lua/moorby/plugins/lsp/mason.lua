return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig"
  },
  lazy = false,
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "flux_lsp",
        "golangci_lint_ls",
        "gopls",
        "groovyls",
        "html",
        "htmx",
        "helm_ls",
        "jsonls",
        "java_language_server",
        "quick_lint_js",
        "tsserver",
        "jqls",
        "lua_ls",
        "marksman",
        "pyright",
        "terraformls",
        "tflint",
        "lemminx",
        "hydra_lsp",
        "yamlls"
      },
      automatic_installation = true -- auto-install LSP servers for languages not already installed when relevant file type is opened
    })
  end
}
