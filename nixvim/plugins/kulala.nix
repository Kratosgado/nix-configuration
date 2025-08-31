{ lib, config, ... }: {
  plugins = {
    which-key.settings.spec = [{
      __unkeyed-1 = "<leader>r";
      group = "Kulala";
      icon = "";
    }];
    rest.enable = true;
    kulala.enable = true;
  };
  extraConfigLua = ''
    local opts = {
          curl_path = "curl",
      -- additional cURL options
      -- see: https://curl.se/docs/manpage.html
      additional_curl_options = {},
      -- gRPCurl path, get from https://github.com/fullstorydev/grpcurl.git
      grpcurl_path = "grpcurl",
      -- websocat path, get from https://github.com/vi/websocat.git
      websocat_path = "websocat",
      openssl_path = "openssl",

      -- set scope for environment and request variables
      -- possible values: b = buffer, g = global
      environment_scope = "g",
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = "dev",
      -- enable reading vscode rest client environment variables
      vscode_rest_client_environmentvars = false,

      -- default timeout for the request, set to nil to disable
      request_timeout = nil,
      -- continue running requests when a request failure is encountered
      halt_on_error = true,

      -- certificates
      certificates = {},
      -- Specify how to escape query parameters
      -- possible values: always, skipencoded = keep %xx as is
      urlencode = "always",

      -- Infer content type from the body and add it to the request headers
      infer_content_type = true,

      -- default formatters/pathresolver for different content types
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = vim.fn.executable("jq") == 1 and { "jq", "." },
          pathresolver = function(...)
            return require("kulala.parser.jsonpath").parse(...)
          end,
        },
        ["application/graphql"] = {
          ft = "graphql",
          formatter = vim.fn.executable("prettier") == 1
            and { "prettier", "--stdin-filepath", "graphql", "--parser", "graphql" },
          pathresolver = nil,
        },
        ["application/xml"] = {
          ft = "xml",
          formatter = vim.fn.executable("xmllint") == 1 and { "xmllint", "--format", "-" },
          pathresolver = vim.fn.executable("xmllint") == 1 and { "xmllint", "--xpath", "{{path}}", "-" },
        },
        ["text/html"] = {
          ft = "html",
          formatter = vim.fn.executable("xmllint") == 1 and { "xmllint", "--format", "--html", "-" },
          pathresolver = nil,
        },
      },

      scripts = {
        -- Resolves "NODE_PATH" environment variable for node scripts. Defaults to the first "node_modules" directory found upwards from "script_file_dir".
        node_path_resolver = nil, ---@type fun(http_file_dir: string, script_file_dir: string, script_data: ScriptData): string|nil
      },

      ui = {
        -- display mode: possible values: "split", "float"
        display_mode = "split",
        -- split direction: possible values: "vertical", "horizontal"
        split_direction = "vertical",
        -- window options to override win_config: width/height/split/vertical.., buffer/window options
        win_opts = { bo = {}, wo = {} }, ---@type kulala.ui.win_config
        -- default view: "body" or "headers" or "headers_body" or "verbose" or fun(response: Response)
        default_view = "body", ---@type "body"|"headers"|"headers_body"|"verbose"|fun(response: Response)
        -- enable winbar
        winbar = true,
        -- Specify the panes to be displayed by default
        -- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats", "verbose", "report", "help" },
        default_winbar_panes = { "body", "headers", "headers_body", "verbose", "script_output", "report", "help" },
        -- enable/disable variable info text
        -- this will show the variable name and value as float
        -- possible values: false, "float"
        show_variable_info_text = false,
        -- icons position: "signcolumn"|"on_request"|"above_request"|"below_request" or nil to disable
        show_icons = "on_request",
        -- default icons
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
          },
          lualine = "🐼",
          textHighlight = "WarningMsg", -- highlight group for request elapsed time
        },

        -- highlight groups for http syntax highlighting
        ---@type table<string, string|vim.api.keyset.highlight>
        syntax_hl = {
          ["@punctuation.bracket.kulala_http"] = "Number",
          ["@character.special.kulala_http"] = "Special",
          ["@operator.kulala_http"] = "Special",
          ["@variable.kulala_http"] = "String",
        },

        -- enable/disable request summary in the output window
        show_request_summary = true,
        -- disable notifications of script output
        disable_script_print_output = false,

        report = {
          -- possible values: true | false | "on_error"
          show_script_output = true,
          -- possible values: true | false | "on_error" | "failed_only"
          show_asserts_output = true,
          -- possible values: true | false | "on_error"
          show_summary = true,

          headersHighlight = "Special",
          successHighlight = "String",
          errorHighlight = "Error",
        },

        -- scratchpad default contents
        scratchpad_default_contents = {
          "@MY_TOKEN_NAME=my_token_value",
          "",
          "# @name scratchpad",
          "POST https://httpbin.org/post HTTP/1.1",
          "accept: application/json",
          "content-type: application/json",
          "",
          "{",
          '  "foo": "bar"',
          "}",
        },

        disable_news_popup = false,
        -- enable/disable lua syntax highlighting
        lua_syntax_hl = true,

        -- Settings for pickers used for Environment, Authentication and Requests Managers
        pickers = {
          snacks = {
            layout = function()
              local has_snacks, snacks_picker = pcall(require, "snacks.picker")
              return not has_snacks and {}
                or vim.tbl_deep_extend("force", snacks_picker.config.layout("telescope"), {
                  reverse = true,
                  layout = {
                    { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                    { win = "preview", width = 0.6 },
                    box = "horizontal",
                    width = 0.8,
                  },
                })
            end,
          },
        },
      },

      lsp = {
        -- enable/disable built-in LSP server
        enable = true,

        --enable/disable/customize  LSP keymaps
        ---@type boolean|table
        keymaps = false, -- disabled by default, as Kulala relies on default Neovim LSP keymaps

        -- enable/disable/customize HTTP formatter
        formatter = {
          sort = { -- enable/disable alphabetical sorting in request body
            metadata = true,
            variables = true,
            commands = false,
            json = true,
          },
        },

        on_attach = nil, -- function called when Kulala LSP attaches to the buffer
      },

      -- enable/disable debug mode
      debug = 3,
      -- enable/disable bug reports on error
      generate_bug_report = false,

      -- set to true to enable default keymaps (check docs or {plugins_path}/kulala.nvim/lua/kulala/config/keymaps.lua for details)
      -- or override default keymaps as shown in the example below.
      ---@type boolean|table
      global_keymaps = {
          ["Send request"] = { -- sets global mapping
            "<leader>rs",
            function() require("kulala").run() end,
            mode = { "n", "v" }, -- optional mode, default is n
            desc = "Send request" -- optional description, otherwise inferred from the key
          },
          ["Send all requests"] = {
            "<leader>ra",
            function() require("kulala").run_all() end,
            mode = { "n", "v" },
            ft = "http", -- sets mapping for *.http files only
          },
          ["Replay the last request"] = {
            "<leader>rr",
            function() require("kulala").replay() end,
            ft = { "http", "rest" }, -- sets mapping for specified file types
          },
        ["Find request"] = {
          "<leader>rf",
          function() require("kulala").search() end,
          mode = { "n", "v" },
          desc = "Find request",
        },
        ["Preview request cURL command"] = {
          "<leader>rp",
          function() require("kulala").preview() end,
          mode = { "n", "v" },
          desc = "Preview request cURL command",
        },
        ["Re-run last request"] = {
          "<leader>rl",
          function() require("kulala").last() end,
          mode = { "n", "v" },
          desc = "Re-run last request",
        },
        ["Run request with variables"] = {
          "<leader>rR",
          function() require("kulala").run(true) end,
          mode = { "n", "v" },
          desc = "Run request with variables",
        },
        ["Jump to previous request"] = {
          "<leader>rP",
          function() require("kulala").jump_prev() end,
          mode = { "n", "v" },
          desc = "Jump to previous request",
        },
        ["Jump to next request"] = {
          "<leader>rn",
          function() require("kulala").jump_next() end,
          mode = { "n", "v" },
          desc = "Jump to next request",
        },
        ["Toggle body/header view"] = {
          "<leader>rt",
          function() require("kulala").toggle_view() end,
          mode = { "n", "v" },
          desc = "Toggle body/header view",
        },
      },

      -- Prefix for global keymaps
      global_keymaps_prefix = "<leader>r",

      -- Kulala UI keymaps, override with custom keymaps as required (check docs or {plugins_path}/kulala.nvim/lua/kulala/config/keymaps.lua for details)
      ---@type boolean|table
      kulala_keymaps = true,
      --[[
        {
          ["Show headers"] = { "H", function() require("kulala.ui").show_headers() end, },
        }
      ]]

      kulala_keymaps_prefix = "",
    }
    require("lz.n").load({
      {
        "mistweaverco/kulala.nvim",
        ft = { "http", "rest" },
        opts = opts,
      }

    })

  '';
  #
  # keymaps = lib.optionals config.plugins.kulala.enable [
  #   {
  #     mode = "n";
  #     key = "<leader>rb";
  #     action = "<cmd>lua require('kulala').scratchpad()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Open scratchpad";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rc";
  #     action = "<cmd>lua require('kulala').copy()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Copy as cURL";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rC";
  #     action = "<cmd>lua require('kulala').from_curl()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Paste from cURL";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rr";
  #     action = "<cmd>lua require('kulala').run()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Run request under cursor";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>ra";
  #     action = "<cmd>lua require('kulala').run_all()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Run all requests";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rs";
  #     action = "<cmd>lua require('kulala').search()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Search requests";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rp";
  #     action = "<cmd>lua require('kulala').preview()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Preview request cURL command";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rl";
  #     action = "<cmd>lua require('kulala').last()<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Re-run last request";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rR";
  #     action = "<cmd>lua require('kulala').run(true)<cr>";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Run request with variables";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rP";
  #     action = "<cmd>lua require('kulala').jump_prev()<cr>";
  #     options = {
  #       noremap = true;
  #       silent = true;
  #       desc = "Jump to previous request";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rn";
  #     action = "<cmd>lua require('kulala').jump_next()<cr>";
  #     options = {
  #       noremap = true;
  #       silent = true;
  #       desc = "Jump to next request";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>rt";
  #     action = "<cmd>lua require('kulala').toggle_view()<cr>";
  #     options = {
  #       noremap = true;
  #       silent = true;
  #       desc = "Toggle body/header view";
  #     };
  #   }
  # ];
}
