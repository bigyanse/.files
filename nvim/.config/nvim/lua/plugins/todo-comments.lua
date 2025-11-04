return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
  },
  keys = {
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Search for todo items in project" },
  },
}
