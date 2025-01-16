    #     keys = [
    #       { key = "gD"; command = "typescript.goToSourceDefinition"; desc = "Goto Source Definition"; }
    #       { key = "gR"; command = "typescript.findAllFileReferences"; desc = "File References"; }
    #       { key = "<leader>co"; command = "source.organizeImports"; desc = "Organize Imports"; }
    #       { key = "<leader>cM"; command = "source.addMissingImports.ts"; desc = "Add missing imports"; }
    #       { key = "<leader>cu"; command = "source.removeUnused.ts"; desc = "Remove unused imports"; }
    #       { key = "<leader>cD"; command = "source.fixAll.ts"; desc = "Fix all diagnostics"; }
    #       { key = "<leader>cV"; command = "typescript.selectTypeScriptVersion"; desc = "Select TS workspace version"; }
    #     ];
    #   };
    # };

{
  programs.neovim = {
    plugins = {
      typescript-tools = {
        enable = true;
        lazyload = {
          enable = true;
          # settings = {
          # cmd = "Neotest";
          # keys = [
          #   {
          #     __unkeyed-1 = "<leader>nt";
          #     __unkeyed-3 = "<CMD>Neotest summary<CR>";
          #     desc = "Summary toggle";
          #   }
          #  ];
          # };
       };
      };
    };
  };
}
