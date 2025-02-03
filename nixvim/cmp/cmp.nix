{ pkgs, config, ... }: {

  plugins = {
    ## snippets...
    cmp-buffer = { enable = true; };
    # cmp-emoji = { enable = true; };
    luasnip.enable = true;
    cmp-path = { enable = true; };
    cmp_luasnip = { enable = true; };
    cmp-cmdline.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-omni.enable = true;
    cmp-dap.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-dictionary.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet = { expand = "luasnip"; };

        # Add priority weights for better sorting
        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "path";
            priority = 500;
          }
          {
            name = "buffer";
            priority = 250;
          }
        ];

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" =
            "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<S-Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };
        experimental = {
          ghost_text = true;
          native_menu = false;
        };

      };
    };
  };

}
