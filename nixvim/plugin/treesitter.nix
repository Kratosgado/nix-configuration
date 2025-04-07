{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context.enable = true;
    # rainbow-delimiters.enable = true;
  };

  extraConfigLuaPost =
    #lua
    ''
        require('nvim-treesitter.configs').setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "vs", -- set to `false` to disable one of the mappings
            node_incremental = "si",
            scope_incremental = "sc",
            node_decremental = "sd",
          },
        },

      }
    '';
}
