require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- MY SHIT
-- "<leader>gg" for lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- "ctrl+backspace" for delete word from right to left
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })