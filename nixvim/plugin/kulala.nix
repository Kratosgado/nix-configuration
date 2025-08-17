{ lib, config, ... }: {
  plugins = {
    which-key.settings.spec = lib.optionals config.plugins.kulala.enable [{
      __unkeyed-1 = "<leader>r";
      group = "Kulala";
      icon = "";
    }];
    rest.enable = true;
    kulala = {
      enable = true;
      settings = {
        additional_curl_options = { };
        debug = true;
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
            formatter = [ "jq" "." ];
            ft = "json";
            pathresolver = {
              __raw = "require('kulala.parser.jsonpath').parse";
            };
          };
          "application/xml" = {
            formatter = [ "xmllint" "--format" "-" ];
            ft = "xml";
            pathresolver = [ "xmllint" "--xpath" "{{path}}" "-" ];
          };
          "text/html" = {
            formatter = [ "xmllint" "--format" "--html" "-" ];
            ft = "html";
            pathresolver = [ ];
          };
        };

      };

    };
  };

  keymaps = lib.optionals config.plugins.kulala.enable [
    {
      mode = "n";
      key = "<leader>rb";
      action = "<cmd>lua require('kulala').scratchpad()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open scratchpad";
      };
    }
    {
      mode = "n";
      key = "<leader>rc";
      action = "<cmd>lua require('kulala').copy()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Copy as cURL";
      };
    }
    {
      mode = "n";
      key = "<leader>rC";
      action = "<cmd>lua require('kulala').from_curl()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Paste from cURL";
      };
    }
    {
      mode = "n";
      key = "<leader>rr";
      action = "<cmd>lua require('kulala').run()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Run request under cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>ra";
      action = "<cmd>lua require('kulala').run_all()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Run all requests";
      };
    }
    {
      mode = "n";
      key = "<leader>rs";
      action = "<cmd>lua require('kulala').search()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Search requests";
      };
    }
    {
      mode = "n";
      key = "<leader>rp";
      action = "<cmd>lua require('kulala').preview()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Preview request cURL command";
      };
    }
    {
      mode = "n";
      key = "<leader>rl";
      action = "<cmd>lua require('kulala').last()<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Re-run last request";
      };
    }
    {
      mode = "n";
      key = "<leader>rR";
      action = "<cmd>lua require('kulala').run(true)<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "Run request with variables";
      };
    }
    {
      mode = "n";
      key = "<leader>rP";
      action = "<cmd>lua require('kulala').jump_prev()<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "Jump to previous request";
      };
    }
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua require('kulala').jump_next()<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "Jump to next request";
      };
    }
    {
      mode = "n";
      key = "<leader>rt";
      action = "<cmd>lua require('kulala').toggle_view()<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle body/header view";
      };
    }
  ];
}
