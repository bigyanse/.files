local plugins = {
  neogit = {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>ngs", "<cmd>Neogit kind=floating<cr>", desc = "Status", { noremap = true, silent = true } },
      { "<leader>ngc", "<cmd>Neogit kind=floating  commit<cr>", desc = "Commit", { noremap = true, silent = true } },
      { "<leader>ngp", "<cmd>Neogit kind=floating  pull<cr>", desc = "Pull", { noremap = true, silent = true } },
      { "<leader>ngP", "<cmd>Neogit kind=floating  push<cr>", desc = "Push", { noremap = true, silent = true } },
      { "<leader>ngr", "<cmd>Neogit kind=floating  reset<cr>", desc = "Reset", { noremap = true, silent = true } },
      { "<leader>ngb", "<cmd>Neogit kind=floating  blame<cr>", desc = "Blame", { noremap = true, silent = true } },
      { "<leader>ngl", "<cmd>Neogit kind=floating  log<cr>", desc = "Log", { noremap = true, silent = true } },
      { "<leader>ngD", "<cmd>Neogit kind=floating  diff<cr>", desc = "Diff", { noremap = true, silent = true } },
      { "<leader>ngS", "<cmd>Neogit kind=floating  stage<cr>", desc = "Stage", { noremap = true, silent = true } },
      { "<leader>ngU", "<cmd>Neogit kind=floating  unstage<cr>", desc = "Unstage", { noremap = true, silent = true } },
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
