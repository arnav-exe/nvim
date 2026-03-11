require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- MY SHIT
-- "<leader>gg" for lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- "<leader>F" to format entire file in normal mode
map("n", "<leader>F", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format entire file" })

-- "<leader>dvd" for dvd screensaver
map("n", "<leader>dvd", "<cmd>Zone dvd<CR>", { desc = "DVD Screensaver" })

-- markdown previewer
-- "<leader>mp" start markdown preview
-- "<leader>ms" stop markdown preview
-- "<leader>mt" toggle markdown preview
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Start markdown preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

-- "ctrl+backspace" for delete word from right to left
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- "<leader>ca" to bring up quickfix menu for current line
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { "quickfix" } }})
end, { desc = "LSP: Apply first available quickfix" })

-- "<leader>gi" activate gitignore generation
local gitignore = require("gitignore")
vim.keymap.set("n", "<leader>gi", gitignore.generate)

-- "]t" to jump to next TODO comment
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

-- "]t" to jump to prev TODO comment
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
