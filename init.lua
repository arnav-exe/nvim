vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

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

require "options"
require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)



-- MY SHIT
-- default to 4 space
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4

-- relative numbers on columns
vim.opt.nu = true
vim.opt.relativenumber = true

-- ":EXP" to open windows explorer in current project dir
vim.api.nvim_create_user_command(
    "EXP",
    function()
        vim.cmd("silent !start explorer .")
    end,
    {
        desc = "Open a new Windows Explorer instance in your current directory",
        force = true
    }
)

-- ":TERM" to launch new term instance in current project dir
vim.api.nvim_create_user_command(
    "TERM",
    function()
        vim.cmd("silent !start wt -F -d .")
    end,
    {
        desc = "Open a new Windows Terminal instance in your current directory",
        force = true
    }
)

-- set telescope ff to vertical
require("telescope").setup({
    defaults = {
        path_display = { "smart" },
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "bottom",
            height = 0.95,
        },
    }
})

-- keep 4 lines between cursor and page border
vim.opt.scrolloff = 4

-- live-server
local live_server_job = nil

local function toggle_live_server()
    -- If already running, stop it
    if live_server_job then
        vim.fn.jobstop(live_server_job)
        live_server_job = nil
        vim.notify("[live-server] stopped")
        return
    end

    local dir  = vim.fn.expand('%:p:h')
    local file = vim.fn.expand('%:t')

    if file == '' then
        vim.notify("[live-server] no file in current buffer", vim.log.levels.WARN)
        return
    end

    live_server_job = vim.fn.jobstart(
        { 'live-server', dir, '--open=' .. file },
        {
            on_exit = function()
                live_server_job = nil
                vim.notify("[live-server] exited")
            end,
        }
    )

    if live_server_job <= 0 then
        vim.notify("[live-server] failed to start", vim.log.levels.ERROR)
        live_server_job = nil
    else
        vim.notify("[live-server] serving " .. dir .. " → " .. file)
    end
end

local function stop_live_server()
    if live_server_job then
        vim.fn.jobstop(live_server_job)
        live_server_job = nil
        vim.notify("[live-server] stopped")
    else
        vim.notify("[live-server] not running", vim.log.levels.WARN)
    end
end

vim.keymap.set('n', '<leader>ls', toggle_live_server, { desc = 'Toggle live-server for current file' })
vim.keymap.set('n', '<leader>lc', stop_live_server, { desc = 'Stop live-server' })
vim.api.nvim_create_user_command('LiveServer', toggle_live_server, {})


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
