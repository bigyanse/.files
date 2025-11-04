return {
  "dlants/magenta.nvim",
  enabled = false,
  lazy = false, -- you could also bind to <leader>mt
  build = "npm install --frozen-lockfile",
  opts = {
    profiles = {
      {
        name = "copilot",
        provider = "openai",
        model = "gpt-4",
        authType = "max",
      },
    },
  },
}
