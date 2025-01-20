{
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    treesitter = {
      enable = true;
      indent.enable = false;
      autotagHtml = true;
      context.enable = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      lspSignature.enable = true;
      # lspsaga.enable = true;
      # lsplines.enable = true;
      trouble = {
        enable = true;
        mappings = {
          lspReferences = "gr";
        };
      };
      otter-nvim.enable = true;
      mappings = {
        goToDefinition = "gd";
        goToDeclaration = "dD";
        goToType = "gt";
        hover = "K";
        nextDiagnostic = "<leader>cn";
        previousDiagnostic = "<leader>cp";
        renameSymbol = "<leader>cr";
        listDocumentSymbols = "<leader>cs";
        codeAction = "<leader>ca";
        documentHighlight = "<leader>ch";
        format = "<leader>cf";
      };
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
      ts.enable = true;
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
