{ pkgs, ... }:

let
  vimConfig = {
    servers = {
      tsserver = { enabled = false; };
      ts_ls = { enabled = false; };
      vtsls = {
        enabled = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
        ];
        settings = {
          complete_function_calls = true;
          vtsls = {
            enableMoveToFileCodeAction = true;
            autoUseWorkspaceTsdk = true;
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true;
              };
            };
          };
          typescript = {
            updateImportsOnFileMove = { enabled = "always"; };
            suggest = { completeFunctionCalls = true; };
            inlayHints = {
              enumMemberValues = { enabled = true; };
              functionLikeReturnTypes = { enabled = true; };
              parameterNames = { enabled = "literals"; };
              parameterTypes = { enabled = true; };
              propertyDeclarationTypes = { enabled = true; };
              variableTypes = { enabled = false; };
            };
          };
        };
        keys = [
          { key = "gD"; command = "typescript.goToSourceDefinition"; desc = "Goto Source Definition"; }
          { key = "gR"; command = "typescript.findAllFileReferences"; desc = "File References"; }
          { key = "<leader>co"; command = "source.organizeImports"; desc = "Organize Imports"; }
          { key = "<leader>cM"; command = "source.addMissingImports.ts"; desc = "Add missing imports"; }
          { key = "<leader>cu"; command = "source.removeUnused.ts"; desc = "Remove unused imports"; }
          { key = "<leader>cD"; command = "source.fixAll.ts"; desc = "Fix all diagnostics"; }
          { key = "<leader>cV"; command = "typescript.selectTypeScriptVersion"; desc = "Select TS workspace version"; }
        ];
      };
    };

    setup = {
      tsserver = null;
      ts_ls = null;
      vtsls = null;
    };
  };
in
{
  home.packages = with pkgs; [
    vimPlugins.nvim-lspconfig
  ];

  programs.neovim = {
    extraPackages = [ pkgs.vimPlugins.nvim-lspconfig ];
    extraConfig = ''
      lua << EOF
      local lspconfig = require('lspconfig')

      lspconfig.vtsls.setup({
        on_attach = function(client, bufnr)
          -- your on_attach logic
        end,
        settings = vimConfig.servers.vtsls.settings,
        flags = { debounce_text_changes = 150 },
      })
      EOF
    '';
  };
}

