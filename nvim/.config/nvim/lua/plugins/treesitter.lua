return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup({
          opts = {
            -- Defaults
            enable_close = true, -- Auto close tags
            enable_rename = true, -- Auto rename pairs of tags
            enable_close_on_slash = false, -- Auto close on trailing </
          },
          -- Also override individual filetype configs, these take priority.
          -- Empty by default, useful if one of the "opts" global settings
          -- doesn't work well in a specific filetype
          per_filetype = {
            ["html"] = {
              enable_close = false,
            },
          },
        })
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup({
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          multiwindow = false, -- Enable multiwindow support.
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true,
          multiline_threshold = 20, -- Maximum number of lines to show for a single context
          trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
          -- Separator between context and content. Should be a single character string, like '-'.
          -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
          separator = nil,
          zindex = 20, -- The Z-index of the context window
          on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        })
      end,
    },
  },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "vim",
      "vimdoc",
      "tmux",
      "tsx",
      "javascript",
      "typescript",
      "prisma",
      "pug",
      "python",
      "solidity",
      "sql",
      "toml",
      "yaml",
      "xml",
      "cpp",
      "rust",
      "go",
      "html",
      "css",
      "scss",
      "php",
      "phpdoc",
      "blade",
      "asm",
      "cmake",
      "comment",
      "haskell",
      "htmldjango",
      "java",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "latex",
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { "ruby", "php" },
    },
    indent = { enable = true, disable = { "ruby", "php" } },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require("nvim-treesitter.install").prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
