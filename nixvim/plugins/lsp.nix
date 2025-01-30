{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>ck" = "goto_prev";
            "<leader>cj" = "goto_next";
            # "<leader>cf" = "open_float";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            # ga = "code_action";  # Trigger code actions (e.g., quick fixes)
            # gf = "format";       # Format document
            # go = "source.organizeImports";  # Organize imports
            "<F2>" = "rename";
          };
        };

        servers = {
          vtsls = {
            enable = true;
            autostart = true;
            #   filetypes = [ "javascript" "javascriptreact" "javascript.jsx" "typescript" "typescriptreact" "typescript.tsx" ];
            #  settings = {
            #   typescript = {
            #     preferences = {
            #       importModuleSpecifierPreference = "relative";
            #     };
            #     format = {
            #       enable = true;
            #     };
            #   };
            # };
            # extraOptions = {
            # };
          };
          rust_analyzer = {
            enable = true;
            autostart = true;
            # installCargo = false;
            # installRustc = false;
            # installRustfmt = true;
          };
          # gopls.enable = true;
          # golangci_lint_ls.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright = {
            enable = true;
            autostart = true;
            # settings.python.analysis.autoImportCompletions = true;
          };
          pylsp.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;

        };
      };
    };
  };
}
