return {
  "ThePrimeagen/vim-be-good",
  event = "VeryLazy",
  config = function()
    vim.g.vim_be_good = {
      -- You can set the difficulty level here
      difficulty = "easy", -- options: easy, medium, hard
      -- You can also set the game mode
      mode = "practice", -- options: practice, challenge
    }
  end,
}
