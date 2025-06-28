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

-- "ctrl+backspace" for delete word from right to left
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })

-- "<leader>F" to format entire file in normal mode
map("n", "<leader>F", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format entire file" })

-- "<leader>F" to format selected text in visual mode
map("v", "<leader>F", function()
  local start_line = vim.fn.line "v"
  local end_line = vim.fn.line "."

  -- ensure the range is in correct order (start <= end)
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- format selected range
  require("conform").format {
    lsp_fallback = true,
    range = {
      start = { start_line, 0 },
      ["end"] = { end_line, 0 },
    },
  }
end, { desc = "Format selected lines" })

-- "<leader>dvd" for dvd screensaver
map("n", "<leader>dvd", "<cmd>Zone dvd<CR>", { desc = "DVD Screensaver" })

-- markdown previewer
-- "<leader>mp" start markdown preview
-- "<leader>ms" stop markdown preview
-- "<leader>mt" toggle markdown preview
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Start markdown preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

-- prevent autocomment on newline (TODO: implement)

