vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.api.nvim_create_user_command("TSInstallAll", function()
	local spec = require("lazy.core.config").plugins["nvim-treesitter"]
	local opts = type(spec.opts) == "table" and spec.opts or {}
	require("nvim-treesitter.install").ensure_installed(opts.ensure_installed)
end, { force = true })

vim.schedule(function()
	require("mappings")
end)

-- MY SHIT
-- treat mdsvex (.svx) files as markdown for syntax highlighting
vim.filetype.add({ extension = { svx = "markdown" } })

-- default to 4 space
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt.scrolloff = 4

-- relative numbers on columns
vim.opt.nu = true
vim.opt.relativenumber = true

-- ":EXP" to open file explorer in current project dir
vim.api.nvim_create_user_command("EXP", function()
	vim.fn.jobstart({ "xdg-open", vim.fn.getcwd() }, { detach = true })
end, {
	desc = "Open Nautilus file explorer silently",
	force = true,
})

-- "<leader>im" to insert python main block after 2 newlines
vim.keymap.set("n", "<leader>im", function()
	local lines = {
		"",
		"",
		'if __name__ == "__main__":',
		"    ",
	}
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, false, lines)

	-- place cursor on indented blank line
	vim.api.nvim_win_set_cursor(0, { row + 4, 4 })
	vim.cmd("startinsert")
end, { desc = "Insert Python main block" })
