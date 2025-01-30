{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context.enable = true;
    rainbow-delimiters.enable = true;
  };

  extraConfigLuaPost =
    #lua
    ''
          require('nvim-treesitter.configs').setup {
      			    init_options = {
            userLanguages = {
              eelixir = "html-eex",
              eruby = "erb",
              rust = "html",
            },
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
              node_incremental = "<leader>si",
              scope_incremental = "<leader>sc",
              node_decremental = "<leader>sd",
            },
          },

        }
    '';
}
