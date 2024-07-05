vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "x", '"_x') -- set 'x' in normal to NOT copy to register

keymap.set("n", "<leader>+", "<C-a>") -- set keymap to increment numbers up
keymap.set("n", "<leader>-", "<C-x>") -- set keymap to increment numbers down

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal length/height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- re-select visual block selection when indenting
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
