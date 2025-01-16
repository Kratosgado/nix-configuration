{ pkgs, ... }: {

  plugins = {
    clangd-extensions.enable = true;
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        nixd.autostart = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        ts_ls = {
          enable = true;
          autostart = true;
        };
        vtsls = {
          enable = true;
          autostart = true;
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
        };
        clangd = {
          enable = true;
          autostart = true;
        };

        ruff.enable = true;
        pyright.enable = true;
        bashls.enable = true;
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
