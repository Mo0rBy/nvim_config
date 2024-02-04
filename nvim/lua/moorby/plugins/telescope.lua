return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous"
          }
        },
        pickers = {
          find_files = {
            previewer = true,
            hidden = true,
          },
          live_grep = {
            previewer = true,
          },
          find_buffers = {
            previewer = true,
          }
        }
      }
    })

    -- set basic keymaps for telescope
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files with Telescope"})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Grep in all files with Telescope + Ripgrep"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find in all opened buffers"})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = "Find keymaps with Telescope"})
  end
}
