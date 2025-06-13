{
  plugins = {
    friendly-snippets.enable = false;
    blink-emoji.enable = true;
    blink-compat = {
      enable = true;
      settings = {
        debug = true;
        impersonate_nvim_cmp = true;
      };
    };
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
        };
        snippets = { preset = "luasnip"; };
        signature = { enabled = true; };
        sources = {
          # cmdline = [ ];
          default = [ "lsp" "path" "snippets" "buffer" ];
          per_filetype = {
            sql = [ "snippets" "dadbod" "buffer" ];
            vue = [ "emoji" ];
            tsx = [ "emoji" ];
            html = [ "emoji" ];
          };
          providers = {
            buffer = { score_offset = -7; };
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };

            emoji = {
              module = "blink-emoji";
              name = "Emoji";
              score_offset = 15;
              # Optional configurations
              opts = { insert = true; };
            };
            lsp = { fallbacks = [ ]; };
          };
        };
      };
    };
  };
}
