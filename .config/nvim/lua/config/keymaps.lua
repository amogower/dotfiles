-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Remap various keys to start a new undoable edit when pressed
map("n", "<space>", "<space><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<space>", "<space><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<space>", "<space><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<bs>", "<bs><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<bs>", "<bs><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<bs>", "<bs><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<cr>", "<cr><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<cr>", "<cr><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<cr>", "<cr><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<left>", "<left><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<left>", "<left><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<left>", "<left><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<right>", "<right><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<right>", "<right><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<right>", "<right><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<up>", "<up><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<up>", "<up><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<up>", "<up><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "<down>", "<down><c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "<down>", "<down><c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "<down>", "<down><c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", ".", ".<c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", ".", ".<c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", ".", ".<c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", ",", ",<c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", ",", ",<c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", ",", ",<c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "(", "(<c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "(", "(<c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "(", "(<c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "[", "[<c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "[", "[<c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "[", "[<c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", "=", "=<c-g>u", { desc = "Start new undoable edit", remap = true })
map("o", "=", "=<c-g>u", { desc = "Start new undoable edit", remap = true })
map("i", "=", "=<c-g>u", { desc = "Start new undoable edit", remap = true })
map("n", '"', '"<c-g>u', { desc = "Start new undoable edit", remap = true })
map("o", '"', '"<c-g>u', { desc = "Start new undoable edit", remap = true })
map("i", '"', '"<c-g>u', { desc = "Start new undoable edit", remap = true })