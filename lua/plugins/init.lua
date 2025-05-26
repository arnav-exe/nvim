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
			{ "<leader>dh", "<cmd>lua require('duck').hatch()<cr>", desc = "spawn a duck" },
			{ "<leader>dc", "<cmd>lua require('duck').cook()<cr>", desc = "cook a duck" },
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
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
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
	-- {
	-- 	"brianhuster/live-preview.nvim",
	-- 	dependencies = {
	-- 		-- You can choose one of the following pickers
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },
}
