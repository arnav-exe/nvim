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
    -- vim golf
    {
        "vuciv/golf",
    },
    -- makes c, d, s, x operations all use black hole register (CURRENTLY BROKEN)
    -- {
    --     "gbprod/cutlass.nvim",
    --     lazy = false
    -- },
    -- for flutter
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
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
    -- keyword highlighting (TODO, FIXME, BUG. etc.)
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false
    },
    -- telescope config
    {
        "nvim-telescope/telescope.nvim",
        opts = function()
            return require("configs.telescope")
        end,
    },
    -- nvimtree config
    {
        "nvim-tree/nvim-tree.lua",
        opts = function(_, opts)
            opts.filters = opts.filters or {}
            opts.filters.dotfiles = false
            opts.filters.git_ignored = false

            opts.git = opts.git or {}
            opts.git.enable = true
            opts.git.ignore = false

            return opts
        end,
    },

}
