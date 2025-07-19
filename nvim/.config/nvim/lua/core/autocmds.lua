vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90",
  desc = "Set cursor back to beam when leaving Neovim.",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.formatexpr = ""
    vim.bo.formatprg = "jq"
  end,
})
