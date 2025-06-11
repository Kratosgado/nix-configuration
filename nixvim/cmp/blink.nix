{ pkgs, ... }: {
  plugins = {
    friendly-snippets.enable = true;
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
        keymap = { preset = "super-tab"; };
        signature = { enabled = true; };
        sources = {
          # cmdline = [ ];
          default = [ "lsp" "path" "snippets" "buffer" ];
          per_filetype = { sql = [ "snippets" "dadbod" "buffer" ]; };
          providers = {
            # buffer = { score_offset = -7; };
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };
            # lsp = { fallbacks = [ ]; };
          };
        };
      };

    };
  };

}
