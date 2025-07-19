local map = vim.keymap.set

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("i", "jj", "<ESC>", { noremap = true })
