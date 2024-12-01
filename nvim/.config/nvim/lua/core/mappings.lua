local map = vim.keymap.set

map("n", "<F4>", function()
  if vim.g.presentation_mode then
    vim.g.presentation_mode = false
    local opts = require("plugins.theme").opts
    opts.transparent = true
    opts.styles = {
      sidebars = "transparent",
    }
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight-night")
    vim.cmd("set nu ruler showcmd laststatus=3")
    vim.cmd("Fidget suppress false")
    vim.cmd("IBLEnable")
    vim.opt.cursorline = true
    vim.keymap.del("n", "<leader>p")
    vim.keymap.del("n", "<leader>n")
  else
    vim.g.presentation_mode = true
    local opts = require("plugins.theme").opts
    opts.transparent = false
    opts.styles = {
      sidebars = "normal",
    }
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight-night")
    vim.cmd("set nonu noruler noshowcmd laststatus=0")
    vim.cmd("Fidget suppress true")
    vim.cmd("IBLDisable")
    vim.opt.cursorline = false
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd("bprev")
    end)
    vim.keymap.set("n", "<leader>n", function()
      vim.cmd("bnext")
    end)
  end
end, { silent = true, noremap = true })
