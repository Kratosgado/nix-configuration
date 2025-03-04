return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        nil_ls = {},
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "nixpkgs_fmt", "injected" },
      },
    },
  },
  {
    "figsoda/nix-develop.nvim",
    event = "VeryLazy",
  },
}
