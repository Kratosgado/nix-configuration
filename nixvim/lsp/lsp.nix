{ pkgs, ... }: {
  plugins = {
    clangd-extensions.enable = true;
    nix.enable = true;
    lsp-lines.enable = true;

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
          autostart = true;
        };
        prismals = {
          enable = true;
          package = null;
          # package = pkgs.prismaPackages."@prisma/language-server";
        };
        vtsls = {
          enable = false;
          autostart = true;
          package = pkgs.vtsls;
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
        clangd = {
          enable = true;
          autostart = true;
        };
        nginx_language_server.enable = true;
        jdtls = {
          enable = true;
          autostart = true;
          settings = {
            init_options = {
              storagePath =
                "~/.jvm/cache"; # Specify your desired cache path here
            };
          };
        };
        kotlin_language_server = {
          enable = true;
          autostart = true;
          settings = {
            init_options = {
              storagePath =
                "~/.jvm/cache"; # Specify your desired cache path here
            };
          };
        };
        gradle_ls = {
          enable = true;
          package = pkgs.gradle;
        };
        groovyls = {
          enable = true;
          package = pkgs.groovy;
        };
        ruff.enable = true;
        pyright.enable = true;
        html.enable = true;
        svelte.enable = true;
        volar = { enable = true; };
        cssls.enable = true;
        bashls.enable = true;
        kulala_ls = {
          enable = true;
          package = null;
          filetypes = [ "http" "rest" ];
        };
        tailwindcss.enable = true;
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
