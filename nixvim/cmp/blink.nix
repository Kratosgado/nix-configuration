{ lib, ... }: {
  plugins = {
    friendly-snippets.enable = false;
    # blink-emoji.enable = true;
    lazydev = {
      enable = true;
      settings = {
        enabled = lib.nixvim.mkRaw ''
          function(root_dir)
            return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
          end
        '';
        library = [
          "lazy.nvim"
          "LazyVim"
          {
            path = "LazyVim";
            words = [ "LazyVim" ];
          }
        ];
        runtime = lib.nixvim.mkRaw "vim.env.VIMRUNTIME";
      };
    };
    blink-compat = {
      enable = true;
      settings = {
        debug = true;
        impersonate_nvim_cmp = true;
      };
    };
    blink-copilot.enable = true;
    copilot-lua.enable = false;
    blink-cmp = {
      enable = true;
      settings = {
        appearance = { use_nvim_cmp_as_default = true; };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution = { enabled = false; };
            };
          };
          documentation = { auto_show = true; };
          ghost_text.enabled = true;
          # list.selection = {
          #   auto_insert = false;
          #   preselect = false;
          # };
          menu.border = "solid";
        };
        keymap = {
          preset = "super-tab";
          "<Tab>" = [ "select_next" "snippet_forward" "fallback" ];
          "<S-Tab>" = [ "select_prev" "snippet_backward" "fallback" ];
          "<CR>" = [ "select_and_accept" "fallback" ];
          "<C-k>" = [ "show_signature" "hide_signature" "fallback" ];
          "<C-Space>" = [ "show" "fallback" ];
          "<C-e>" = [ "hide" "fallback" ];
        };
        snippets = { preset = "luasnip"; };
        signature = { enabled = true; };
        sources = {
          # cmdline = [ ];
          default = [ "lsp" "path" "snippets" "buffer" "copilot" ];
          per_filetype = {
            sql = [ "lsp" "snippets" "dadbod" "buffer" "copilot" ];
            lua = [ "lazydev" "lsp" "path" "buffer" "snippets" ];
          };
          providers = {
            buffer = { score_offset = -7; };
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };
            lazydev = {
              name = "LazyDev";
              module = "lazydev.integrations.blink";
              # make lazydev completions top priority (see `:h blink.cmp`)
              score_offset = 100;
            };
            copilot = {
              async = true;
              module = "blink-copilot";
              name = "copilot";
              score_offset = 100;
              # Optional configurations
              opts = {
                max_completions = 3;
                max_attempts = 4;
                kind = "Copilot";
                debounce = 750;
                auto_refresh = {
                  backward = true;
                  forward = true;
                };
              };
            };

            # emoji = {
            #   module = "blink-emoji";
            #   name = "Emoji";
            #   score_offset = 15;
            #   # Optional configurations
            #   opts = {
            #     insert = true;
            #     trigger = "~";
            #   };
            # };
            lsp = { fallbacks = [ ]; };
          };
        };
      };
    };
  };
}
