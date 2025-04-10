{
  plugins.none-ls = {
    enable = true;
    # lazyLoad.enable = true;
    enableLspFormat = true;
    sources = {
      diagnostics = {
        actionlint.enable = true;
        cppcheck.enable = true;
        mypy.enable = true;
        ktlint.enable = true;
        todo_comments.enable = true;
      };
      completion.luasnip.enable = true;
      code_actions = {
        refactoring.enable = true;
        # ts_node_action.enable = true;
      };
      formatting = {
        nixfmt.enable = true;
        asmfmt.enable = true;
        yamlfix.enable = true;
        yamlfmt.enable = true;
        markdownlint.enable = true;
        shellharden.enable = true;
        clang_format.enable = true;
        cmake_format.enable = true;
        google_java_format.enable = true;
        ktlint.enable = true;
        prisma_format.enable = true;
        prettierd = {
          enable = true;
          disableTsServerFormatter = true;
        };
        stylua.enable = true;
        black.enable = true;
      };
    };
  };
  plugins.lsp-format = { enable = true; };
}
