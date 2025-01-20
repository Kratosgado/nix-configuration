{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "kulala.nvim" = {
      package = pkgs.vimPlugins.kulala-nvim;
      setupModule = "kulala";
      setupOpts = {
        additional_curl_options = {};
        debug = false;
        default_env = "dev";
        default_view = "body";
        environment_scope = "b";
        icons = {
          inlay = {
            done = "✅";
            error = "❌";
            loading = "⏳";
          };
          lualine = "🐼";
        };
        contenttypes = {
          "application/json" = {
            formatter = [
              "jq"
              "."
            ];
            ft = "json";
            pathresolver = {
              __raw = "require('kulala.parser.jsonpath').parse";
            };
          };
          "application/xml" = {
            formatter = [
              "xmllint"
              "--format"
              "-"
            ];
            ft = "xml";
            pathresolver = [
              "xmllint"
              "--xpath"
              "{{path}}"
              "-"
            ];
          };
          "text/html" = {
            formatter = [
              "xmllint"
              "--format"
              "--html"
              "-"
            ];
            ft = "html";
            pathresolver = [];
          };
        };
      };
      after = ''
        -- custom lua code to run after plugin is loaded
        print('kulala loaded')
      '';

      # Explicitly mark plugin as lazy. You don't need this if you define one of
      # the trigger "events" below
      lazy = true;

      # load on command
      # cmd = ["AerialOpen"];
      ft = ["http" ".http" "rest" ".rest"];

      # load on event
      event = ["BufEnter"];

      # load on keymap
      keys = [
        {
          mode = "n";
          key = "<leader>r";
          action = "";
          silent = true;
          noremap = true;
          desc = "+Rest";
        }
        {
          mode = "n";
          key = "<leader>rb";
          action = "<cmd>lua require('kulala').scratchpad()<cr>";
          silent = true;
          noremap = true;
          desc = "Open scratchpad";
        }
        {
          mode = "n";
          key = "<leader>rc";
          action = "<cmd>lua require('kulala').copy()<cr>";
          silent = true;
          noremap = true;
          desc = "Copy as cURL";
        }
        {
          mode = "n";
          key = "<leader>rC";
          action = "<cmd>lua require('kulala').from_curl()<cr>";
          silent = true;
          noremap = true;
          desc = "Paste from cURL";
        }
        {
          mode = "n";
          key = "<leader>rr";
          action = "<cmd>lua require('kulala').run()<cr>";
          silent = true;
          noremap = true;
          desc = "Run request under cursor";
        }
        {
          mode = "n";
          key = "<leader>ra";
          action = "<cmd>lua require('kulala').run_all()<cr>";
          silent = true;
          noremap = true;
          desc = "Run all requests";
        }
        {
          mode = "n";
          key = "<leader>rs";
          action = "<cmd>lua require('kulala').search()<cr>";
          silent = true;
          noremap = true;
          desc = "Search requests";
        }
        {
          mode = "n";
          key = "<leader>rp";
          action = "<cmd>lua require('kulala').preview()<cr>";
          silent = true;
          noremap = true;
          desc = "Preview request cURL command";
        }
        {
          mode = "n";
          key = "<leader>rl";
          action = "<cmd>lua require('kulala').last()<cr>";
          silent = true;
          noremap = true;
          desc = "Re-run last request";
        }
        {
          mode = "n";
          key = "<leader>rR";
          action = "<cmd>lua require('kulala').run(true)<cr>";
          silent = true;
          noremap = true;
          desc = "Run request under cursor with variables";
        }
        {
          mode = "n";
          key = "<leader>rp";
          action = "<cmd>lua require('kulala').jump_prev()<cr>";
          noremap = true;
          silent = true;
          desc = "Jump to the previous request";
        }
        {
          mode = "n";
          key = "<leader>rn";
          action = "<cmd>lua require('kulala').jump_next()<cr>";
          noremap = true;
          silent = true;
          desc = "Jump to the next request";
        }
        {
          mode = "n";
          key = "<leader>rt";
          action = "<cmd>lua require('kulala').toggle_view()<cr>";
          noremap = true;
          silent = true;
          desc = "Toggle body and header";
        }
      ];
    };
  };
}
