-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set leader key
vim.g.mapleader = " "

-- Compile and run the current file based on filetype
vim.api.nvim_set_keymap("n", "<leader>r", ":lua CompileAndRun()<CR>", { noremap = true, silent = true })

-- Keymaps for copilot.vim

vim.api.nvim_set_keymap("i", "<C-Right>", "copilot#Accept()", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "copilot#Suggest()", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-e>", "copilot#Dismiss()", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Next()", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-p>", "copilot#Previous()", { expr = true, noremap = true, silent = true })
