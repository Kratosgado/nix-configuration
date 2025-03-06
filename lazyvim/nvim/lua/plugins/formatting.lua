return {
  {
    "stevearc/conform.nvim",
    opts = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      nix = { "nixfmt" },
      svelte = { "prettierd" },
      -- You can also customize some of the format options for the filetype
      rust = { "rustfmt", lsp_format = "fallback" },
      -- You can use a function here to determine the formatters dynamically
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = {},
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  },
}
