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

-- silently save current buffer on leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if vim.bo.modified and vim.bo.modifiable and vim.fn.expand("%") ~= "" then
            vim.cmd("silent! write")
        end
    end,
})
