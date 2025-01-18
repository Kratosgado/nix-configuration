{
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      lspSignature.enable = true;
      lspsaga.enable = true;
      lsplines.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      lspconfig = {
        enable = true;
        # sources =
        #   #lua
        #   ''return { { "neovim/nvim-lspconfig",
        #        init_options = {
        #          userLanguages = {
        #            eelixir = "html-eex",
        #            eruby = "erb",
        #            rust = "html",
        #          },
        #        },}}'';
      };
    };
    languages = {
      enableLSP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableDAP = true;
      enableTreesitter = true;
      nix.enable = true;
      bash.enable = true;
      assembly.enable = true;
      clang.enable = true;
      clang.cHeader = true;
      lua.enable = true;
      html.enable = true;
      css.enable = true;
      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      rust = {
        enable = true;
        crates.enable = true;
        dap.enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      kotlin.enable = true;
      markdown.enable = true;
      python.enable = true;
      tailwind.enable = true;
    };
  };
}
