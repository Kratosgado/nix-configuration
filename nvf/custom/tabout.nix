{pkgs, ...}: {
  programs.nvf.settings.vim.extraPlugins = {
    package = pkgs.vimPlugins.tabout-nvim;
    after = ["nvim-treesitter" "luasnip" "nvim-cmp"];
    lazy = false;
    setup =
      #lua
      ''
           require("tabout").setup({
          tabkey = "<Tab>",
          backwards_tabkey = "<S-Tab>",
          act_as_tab = true,
          act_as_shift_tab = false,
          default_tab = "<C-t>",
          default_shift_tab = "<C-d>",
          enable_backwards = true,
          completion = false,
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
            { open = "<", close = ">" },
          },
          ignore_beginning = true,
          exclude = {},
        })
      '';
  };
  programs.nvf.settings.vim.lazy.plugins = {
    "tabout" = {
      package = pkgs.vimPlugins.tabout-nvim;
      setupModule = "tabout";
      lazy = false;
      priority = 1000;
      event = "InsertCharPre";
    };
  };
}
