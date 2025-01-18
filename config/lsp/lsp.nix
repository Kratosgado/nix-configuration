{ pkgs, ... }: {

  plugins = {
    clangd-extensions.enable = true;
    lsp = {
      enable = true;
      # lazyLoad.enable = true;
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
          package = pkgs.prisma;
        };
        vtsls = {
          enable = true;
          autostart = true;
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
        cssls.enable = true;
        bashls.enable = true;
        kulala_ls = {
          enable = true;
          package = pkgs.kulala-fmt;
        };
        tailwindcss.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
        "<F2>" = "rename";
      };

    };
  };
}
