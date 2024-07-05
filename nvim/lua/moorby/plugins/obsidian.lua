
-- This function will:
-- 1. Prompt user to select the Obsidian vault for the new note
-- 2. Create a new Obsidian note
-- 3. Delete everything in the file (removes the default Obsidian template)
-- 4. Prompt user to select a note template
local create_note_func = function()
  vim.ui.select( -- Using this means it depends on "stevearc/dressing.nvim" for a nice UI
    { "work", "non-work" },
    { prompt = "Select a vault: " },
    function (choice)
      if choice == "work" then
        vim.cmd("cd ~/Obsidian_vaults/work-vault")
      elseif choice == "non-work" then
        vim.cmd("cd ~/Obsidian_vaults/second-brain")
      else
        print("No valid choice was selected. Exiting...")
        return
      end


      vim.cmd('ObsidianNew')
      vim.cmd('%d')
      vim.cmd('ObsidianTemplate')
    end
  )
end


return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "ObsidianNew", "ObsidianOpen", "ObsidianTemplate", "NewNote" },
  keys = {
    { "<leader>nn", create_note_func, { desc = "Create a new Obsidian note (1. Choose a vault 2. Choose file name, 3. Choose note template" }}
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim", -- Some custom functions depend on this
  },
  config = function()
    -- Set plugin configuration
    require("obsidian").setup({
      workspaces = {
        {
          name = "non-work",
          path = "~/Obsidian_vaults/second-brain",
        },
        {
          name = "work",
          path = "~/Obsidian_vaults/work-vault",
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

    -- This custom command is needed to launch nvim and immeadiately execute the "create_note_func" function
    -- (this allows me to create a custom bash script so I can create a new note directly in the terminal)
    vim.api.nvim_create_user_command("NewNote",function()
      create_note_func()
    end,{})

    -- Set useful keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>ft", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g | noh<CR>", { desc = "Format note title (cursor must be on title line)" })
  end
}
