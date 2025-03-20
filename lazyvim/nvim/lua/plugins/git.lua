return {
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "~" },
        untracked = { text = "+" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "~" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      { "petertriho/cmp-git", opts = {} },
    },
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "git" })
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "BufReadPost",
  --   opts = {
  --     suggestion = {
  --       enabled = not vim.g.ai_cmp,
  --       auto_trigger = true,
  --       hide_during_completion = vim.g.ai_cmp,
  --       keymap = {
  --         accept = false, -- handled by nvim-cmp / blink.cmp
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --       },
  --     },
  --     panel = { enabled = false },
  --     filetypes = {
  --       markdown = true,
  --       help = true,
  --     },
  --   },
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = function()
  --     LazyVim.cmp.actions.ai_accept = function()
  --       if require("copilot.suggestion").is_visible() then
  --         LazyVim.create_undo()
  --         require("copilot.suggestion").accept()
  --         return true
  --       end
  --     end
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   opts = {},
  --   config = function(_, opts)
  --     local copilot_cmp = require("copilot_cmp")
  --     copilot_cmp.setup(opts)
  --     -- attach cmp source whenever copilot attaches
  --     -- fixes lazy-loading issues with the copilot cmp source
  --     LazyVim.lsp.on_attach(function()
  --       copilot_cmp._on_insert_enter({})
  --     end, "copilot")
  --   end,
  --   specs = {
  --     {
  --       "hrsh7th/nvim-cmp",
  --       optional = true,
  --       ---@param opts cmp.ConfigSchema
  --       opts = function(_, opts)
  --         table.insert(opts.sources, 1, {
  --           name = "copilot",
  --           group_index = 1,
  --           priority = 100,
  --         })
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(
  --       opts.sections.lualine_x,
  --       2,
  --       LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
  --         local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
  --         if #clients > 0 then
  --           local status = require("copilot.api").status.data.status
  --           return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
  --         end
  --       end)
  --     )
  --   end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   optional = true,
  --   dependencies = { -- this will only be evaluated if nvim-cmp is enabled
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require("copilot_cmp")
  --         copilot_cmp.setup(opts)
  --         -- attach cmp source whenever copilot attaches
  --         -- fixes lazy-loading issues with the copilot cmp source
  --         LazyVim.lsp.on_attach(function()
  --           copilot_cmp._on_insert_enter({})
  --         end, "copilot")
  --       end,
  --       specs = {
  --         {
  --           "hrsh7th/nvim-cmp",
  --           optional = true,
  --           ---@param opts cmp.ConfigSchema
  --           opts = function(_, opts)
  --             table.insert(opts.sources, 1, {
  --               name = "copilot",
  --               group_index = 1,
  --               priority = 100,
  --             })
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
}
