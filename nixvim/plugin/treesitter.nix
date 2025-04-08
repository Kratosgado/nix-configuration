{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        init_options = {
          userLanguages = {
            eelixir = "html-eex";
            eruby = "erb";
            rust = "html";
          };
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "vs";
            node_incremental = "si";
            scope_incremental = "sc";
            node_decremental = "sd";
          };
        };
      };
    };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    treesitter-refactor.enable = true;
    # rainbow-delimiters.enable = true;
  };
}
