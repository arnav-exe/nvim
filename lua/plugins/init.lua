return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
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
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" }
    }
  },
  {
    'tamton-aquib/duck.nvim',
    keys = {
      {"<leader>dh", "<cmd>lua require('duck').hatch()<cr>", desc = "spawn a duck"},
      {"<leader>dc", "<cmd>lua require('duck').cook()<cr>", desc = "cook a duck"},
      {"<leader>da", "<cmd>lua require('duck').cook_all()<cr>", desc = "cook all ducks"}
    }
  },
  {
  "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}
