{ pkgs, lib, ... }: {
  plugins = {
    clangd-extensions.enable = true;
    nix.enable = true;
    lsp-lines.enable = true;
    vim-dadbod-completion.enable = true;
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = true;

    lsp = {
      enable = true;
      # lazyLoad.enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
        nixd.autostart = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        ts_ls = {
          enable = true;
          autostart = false;
          settings.filetypes = [ "vue" "typescript" "javascript" ];
        };
        prismals = {
          enable = true;
          package = null;
        };
        vtsls = {
          enable = true;
          autostart = false;
          package = pkgs.vtsls;
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
        clangd.enable = true;
        cmake.enable = true;
        nginx_language_server.enable = true;
        kotlin_language_server = {
          enable = true;
          settings = {
            init_options = {
              storagePath =
                "/tmp/kotlin-lsp-cache"; # Specify your desired cache path here
            };
          };

        };
        gradle_ls = {
          enable = true;
          package = null;
        };
        groovyls = {
          enable = true;
          package = pkgs.groovy;
        };
        ruff.enable = false;
        pyright.enable = true;
        html.enable = true;
        svelte.enable = true;
        volar = { enable = true; };
        cssls.enable = true;
        bashls.enable = true;
        kulala_ls = {
          enable = true;
          package = null;
          filetypes = [ "http" "rest" "hurl" ];
        };
        eslint.enable = true;
        tailwindcss.enable = true;
        dockerls.enable = true;
        docker_compose_language_service.enable = true;
        asm_lsp.enable = true;
        yamlls.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<F2>" = "rename";
        };

        extra = [
          {
            action = "<CMD>LspStop<Enter>";
            key = "<leader>lx";
            options.desc = "Lsp stop";
          }
          {
            action = "<CMD>LspLog<Enter>";
            key = "<leader>ll";
            options.desc = "Lsp stop";
          }
          {
            mode = "n";
            key = "<leader>li";
            action = "<cmd>LspInfo<cr>";
            options.desc = "Lsp Info";
          }
          {
            action = "<CMD>LspStart<Enter>";
            key = "<leader>ls";
            options.desc = "Lsp start";
          }
          {
            action = "<CMD>LspRestart<Enter>";
            key = "<leader>lr";
            options.desc = "Lsp restart";
          }
        ];
      };
    };
  };
}
