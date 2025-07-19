local plugins = {
  neogit = {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>ngs", "<cmd>Neogit<cr>", desc = "Status", { noremap = true, silent = true } },
      { "<leader>ngc", "<cmd>Neogit commit<cr>", desc = "Commit", { noremap = true, silent = true } },
      { "<leader>ngp", "<cmd>Neogit push<cr>", desc = "Push", { noremap = true, silent = true } },
      { "<leader>ngr", "<cmd>Neogit reset<cr>", desc = "Reset", { noremap = true, silent = true } },
      { "<leader>ngb", "<cmd>Neogit blame<cr>", desc = "Blame", { noremap = true, silent = true } },
      { "<leader>ngl", "<cmd>Neogit log<cr>", desc = "Log", { noremap = true, silent = true } },
      { "<leader>ngD", "<cmd>Neogit diff<cr>", desc = "Diff", { noremap = true, silent = true } },
      { "<leader>ngS", "<cmd>Neogit stage<cr>", desc = "Stage", { noremap = true, silent = true } },
      { "<leader>ngU", "<cmd>Neogit unstage<cr>", desc = "Unstage", { noremap = true, silent = true } },
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  fugitive = {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb", -- optional
    },
  },
}

return plugins["neogit"]
