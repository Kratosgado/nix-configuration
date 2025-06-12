{
  plugins = {
    friendly-snippets.enable = true;
    blink-cmp-dictionary.enable = true;
    blink-emoji.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        appearance = { use_nvim_cmp_as_default = true; };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution = { enabled = true; };
            };
          };
          documentation = { auto_show = true; };
          ghost_text.enabled = true;
          list.selection = {
            auto_insert = false;
            preselect = false;
          };
          menu.border = "solid";
        };

        keymap = {
          preset = "super-tab";
          "<Tab>" = [ "snippet_forward" "select_next" "fallback" ];
          "<S-Tab>" = [ "snippet_backward" "select_prev" "fallback" ];
          "<CR>" = [ "select_and_accept" "fallback" ];
          "<C-k>" = [ "show_signature" "hide_signature" "fallback" ];
        };
        signature = { enabled = true; };
        sources = {
          # cmdline = [ ];
          default = [ "lsp" "path" "snippets" "buffer" "dictionary" ];
          per_filetype = {
            sql = [ "snippets" "dadbod" "buffer" ];
            vue = [ "emoji" ];
            tsx = [ "emoji" ];
            html = [ "emoji" ];
          };
          providers = {
            # buffer = { score_offset = -7; };
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
            dictionary = {
              module = "blink-cmp-dictionary";
              name = "Dict";
              score_offset = 100;
              min_keyword_length = 3;
              # Optional configurations
              opts = { };
            };
            # lsp = { fallbacks = [ ]; };
          };
        };
      };
    };
  };
}
