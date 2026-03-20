return {
    {
        "stevearc/conform.nvim",
        lazy = false,
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    -- MY SHIT
    -- lazygit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
        },
    },
    -- duck
    {
        "tamton-aquib/duck.nvim",
        keys = {
            { "<leader>dh", "<cmd>lua require('duck').hatch()<cr>",    desc = "spawn a duck" },
            { "<leader>dc", "<cmd>lua require('duck').cook()<cr>",     desc = "cook a duck" },
            { "<leader>da", "<cmd>lua require('duck').cook_all()<cr>", desc = "cook all ducks" },
        },
    },
    -- todo comment highlighter
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- disable lazy load on whichkey
    {
        "folke/which-key.nvim",
        lazy = false,
        opts = {
            spec = {
                { "<leader>gc", group = "conflict" },
            },
        },
    },
    -- hlslens (scrollbar dependency)
    {
        "kevinhwang91/nvim-hlslens",
        lazy = false,
    },
    -- add scrollbars
    {
        "petertriho/nvim-scrollbar",
        lazy = false,
        config = function()
            require("scrollbar").setup()
        end,
    },
    -- java lsp and lint and dap and stuff
    {
        "nvim-java/nvim-java",
        config = function()
            require("java").setup()
        end,
    },
    -- copilot
    {
        "github/copilot.vim",
    },
    -- DVD screensaver
    {
        "arnav-exe/zone.nvim",
        lazy = false,
    },
    -- markdown previewer
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    -- better UI for messages, cmdline and popupmenu
    -- {
    -- 	"folke/noice.nvim",
    -- 	event = "VeryLazy",
    -- 	opts = {
    -- 		-- add any options here
    -- 	},
    -- 	dependencies = {
    -- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    -- 		"MunifTanjim/nui.nvim",
    -- 		-- OPTIONAL:
    -- 		--   `nvim-notify` is only needed, if you want to use the notification view.
    -- 		--   If not available, we use `mini` as the fallback
    -- 		"rcarriga/nvim-notify",
    -- 	},
    -- },
    -- live preview for html (CURRENTLY BROKEN: attempts to boot powershell using 'pwsh' command which only works on PowerShell 5. I am using PowerShell 7)
    {
        "brianhuster/live-preview.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        lazy = false,
    },
    -- mirror inserts to end of word object
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- default [c, C, s, S, d, D, x, X] to black hole register
    {
        "gbprod/cutlass.nvim",
        opts = {
            exclude = { "nd", "ndd", "nD" },
            lazy = false
        }
    },
    -- automatic gitignore generation
    {
        "wintermute-cell/gitignore.nvim",
        config = function()
            require('gitignore')
        end,
    },
    -- visual git conflict handler
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = true,
        lazy = false,
        opts = {
            default_mappings = false,
        },
        keys = {
            { "<leader>gco", "<Plug>(git-conflict-ours)",          desc = "Choose Ours" },
            { "<leader>gct", "<Plug>(git-conflict-theirs)",        desc = "Choose Theirs" },
            { "<leader>gcb", "<Plug>(git-conflict-both)",          desc = "Choose Both" },
            { "<leader>gc0", "<Plug>(git-conflict-none)",          desc = "Choose None" },
            { "]x",          "<Plug>(git-conflict-next-conflict)", desc = "Next Conflict" },
            { "[x",          "<Plug>(git-conflict-prev-conflict)", desc = "Previous Conflict" },
            { "<leader>gcq", "<cmd>GitConflictListQf<cr>",         desc = "Conflicts to Quickfix" },
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            indent = {
                enabled = true,
                animate = {
                    enabled = false,
                }
            },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                }
            }
        },
        keys = {
            -- Top Pickers & Explorer
            { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>;",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
            { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
            { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
            -- find
            { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
            { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
            { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
            { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
            -- git
            { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
            { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
            { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
            { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
            { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
            { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
            { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
            -- gh
            { "<leader>ghi",     function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
            { "<leader>ghI",     function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
            { "<leader>ghp",     function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
            { "<leader>ghP",     function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
            -- Grep
            { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
            { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",   mode = { "n", "x" } },
            -- other
            { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
            { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
            { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
            { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",             mode = { "n", "t" } },
            { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",             mode = { "n", "t" } },
        },
    },
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "<leader>c",  nil,                              desc = "Claude Code" },
            { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
            { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
            { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
            { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            { "<leader>csm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
            { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
            {
                "<leader>cs",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Add file",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
        },
    }
}
