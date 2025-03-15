return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http", -- Only load for HTTP files
    opts = {
      curl_path = "curl",
      -- Display mode, possible values: "split", "float"
      display_mode = "split",
      -- split direction
      -- possible values: "vertical", "horizontal"
      split_direction = "vertical",
      -- default_view, body or headers or headers_body
      default_view = "body",
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = "dev",
      debug = false,
      -- default formatters/pathresolver for different content types
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "jq", "." },
        },
        ["text/html"] = {
          ft = "html",
          formatter = { "xmllint", "--format", "--html", "-" },
          pathresolver = {},
        },
      },
      -- additional cURL options
      -- see: https://curl.se/docs/manpage.html
      additional_curl_options = {},
      show_icons = "on_request",
      icons = {
        inlay = {
          loading = "⏳",
          done = "✅",
          error = "❌",
        },
        lualine = "🐼",
      },
      scratchpad_default_contents = {
        "token=value",
        "",
        "# @name scratchpad",
        "accept: application/json",
        "content-type: application/json",
        "",
      },
      -- enable winbar
      winbar = false,
      -- Specify the panes to be displayed by default
      -- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats" },
      default_winbar_panes = { "body", "headers_body", "script_output" },
      -- enable reading vscode rest client environment variables
      vscode_rest_client_environmentvars = false,
      -- disable the vim.print output of the scripts
      -- they will be still written to disk, but not printed immediately
      disable_script_print_output = false,
      -- set scope for environment and request variables
      -- possible values: b = buffer, g = global
      environment_scope = "g",
      -- certificates
      certificates = {},
    },
    config = function(_, opts)
      -- Set up the plugin with the options
      require("kulala").setup(opts)

      -- Set up keymaps only for HTTP files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function()
          -- Set up which-key group
          vim.keymap.set("n", "<leader>r", "", {
            silent = true,
            noremap = true,
            desc = "+Rest",
          })

          -- Apply all the keymaps
          vim.keymap.set("n", "<leader>rb", "<cmd>lua require('kulala').scratchpad()<cr>", {
            silent = true,
            noremap = true,
            desc = "Open scratchpad",
          })

          vim.keymap.set("n", "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", {
            silent = true,
            noremap = true,
            desc = "Copy as cURL",
          })

          vim.keymap.set("n", "<leader>rC", "<cmd>lua require('kulala').from_curl()<cr>", {
            silent = true,
            noremap = true,
            desc = "Paste from cURL",
          })

          vim.keymap.set("n", "<leader>rr", "<cmd>lua require('kulala').run()<cr>", {
            silent = true,
            noremap = true,
            desc = "Run request under cursor",
          })

          vim.keymap.set("n", "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", {
            silent = true,
            noremap = true,
            desc = "Run all requests",
          })

          vim.keymap.set("n", "<leader>rs", "<cmd>lua require('kulala').search()<cr>", {
            silent = true,
            noremap = true,
            desc = "Search requests",
          })

          vim.keymap.set("n", "<leader>rp", "<cmd>lua require('kulala').preview()<cr>", {
            silent = true,
            noremap = true,
            desc = "Preview request cURL command",
          })

          vim.keymap.set("n", "<leader>rl", "<cmd>lua require('kulala').last()<cr>", {
            silent = true,
            noremap = true,
            desc = "Re-run last request",
          })

          vim.keymap.set("n", "<leader>rR", "<cmd>lua require('kulala').run(true)<cr>", {
            silent = true,
            noremap = true,
            desc = "Run request with variables",
          })

          vim.keymap.set("n", "<leader>rP", "<cmd>lua require('kulala').jump_prev()<cr>", {
            noremap = true,
            silent = true,
            desc = "Jump to previous request",
          })

          vim.keymap.set("n", "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", {
            noremap = true,
            silent = true,
            desc = "Jump to next request",
          })

          vim.keymap.set("n", "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", {
            noremap = true,
            silent = true,
            desc = "Toggle body/header view",
          })
        end,
      })
    end,
  },
}
