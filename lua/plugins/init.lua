return {
  { import = "plugins.code-runner" },
  { import = "plugins.color" },
  { import = "plugins.diagnostics" },
  { import = "plugins.editing-support" },
  { import = "plugins.language-support" },
  { import = "plugins.motion" },
  { import = "plugins.test" },
  { import = "plugins.theme" },
  { import = "plugins.ui" },

  -- disable core plugins
  { "max397574/better-escape.nvim", enabled = false },

  -- Very small specs not worth their own files
  { "kevinhwang91/nvim-bqf", ft = "qf", opts = {} }, --Debugging
  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "wakatime/vim-wakatime", event = "User AstroFile" }, -- Development time analytics
  { "jabirali/vim-tmux-yank", event = "User AstroFile" }, --tmux yank integration
  { "m-demare/hlargs.nvim", opts = {}, event = "User AstroFile" },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    cmd = {
      "PeekOpen",
      "PeekClose",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    config = true,
  },
}
