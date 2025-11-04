vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.syntax = "on"
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.pack.add({
	-- Theme
	{ src = "https://github.com/folke/tokyonight.nvim" },

	-- LSPs
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Completions
	{ src = "https://github.com/saghen/blink.cmp" },

	-- Formatters, Linters
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Fuzzy Finders
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- Lines
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Todo Comments
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

-- Theme
require("tokyonight").setup({
	style = "night",
	transparent = true,
})

vim.cmd("colorscheme tokyonight")

-- LSPs
local servers = {
	lua_ls = {},
	pyright = {},
}
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"ruff",
})
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = ensure_installed,
})

-- Completions
require("blink.cmp").setup({
	completion = { documentation = { auto_show = false } },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "lua" },
})

-- Formatters, Linters
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Fuzzy Finders
require("fzf-lua").setup()

vim.keymap.set("n", "<leader>ss", ":FzfLua global resume=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sf", ":FzfLua files resume=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sg", ":FzfLua live_grep resume=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers resume=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sh", ":FzfLua helptags resume=true<CR>", { noremap = true })

-- File Trees
vim.keymap.set("n", "<leader>ntt", ":Lex<CR>", { noremap = true })

-- Lines
require("lualine").setup({
	options = {
		globalstatus = true,
	},
})

-- Todo Comments
require("todo-comments").setup()
