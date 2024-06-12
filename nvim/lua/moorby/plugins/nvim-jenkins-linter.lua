return {
  "ckipp01/nvim-jenkinsfile-linter",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "Jenkinsfile" },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>jfl", require("jenkinsfile_linter").validate, {desc =  "Run Jenkinsfile linter validation against a Jenkins instance"})
  end,
}
