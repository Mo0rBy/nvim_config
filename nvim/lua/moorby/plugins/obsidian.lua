return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "ObsidianNew", "ObsidianOpen" },
  keys = {
    { "<leader>sb", ":cd /Users/wmoorby/Obsidian_vaults/second-brain/inbox<CR>", desc = "Change directory to 'Second Brain' Obsidian vault" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    -- Set plugin configuration
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/Obsidian_vaults/second-brain",
        },
        {
          name = "work",
          path = "~/Obsidian_vaults/midgard-vault",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      disable_frontmatter = false,
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
      },
      note_id_func = function(title)
        local formatted_title = string.gsub(title, " ", "-")
        local today_date = os.date("%Y-%m-%d")
        -- returns YYYY-mm-dd_my-title
        return tostring(today_date .. "_" .. formatted_title)
      end,
      mappings = {
        -- "Obsidian follow"
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes "obsidian done"
        ["<leader>od"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      }
    })

    -- Set useful keymaps
    local keymap = vim.keymap

    local create_note_func = function()
      vim.cmd('ObsidianNew')
      vim.cmd('%d') -- delete everything in file (removes default Obsidian template)
      vim.cmd('ObsidianTemplate')
    end
    keymap.set("n", "<leader>nn", create_note_func, { desc = "Create a new Obsidian note (1. choose file name, 2. choose note template" })

    keymap.set("n", "<leader>ft", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g | noh<CR>", { desc = "Format note title (cursor must be on title line)" })

  end
}
