{ pkgs, config, ... }: {
  # Import all your configuration modules here
  programs.nixvim = {
    imports = [
      ./cmp
      ./lsp
      ./plugin-manager/lazy.nix
      ./ui
      ./plugin
      ./normal-config
      ./utils
      # ./debugs
    ];
    enable = false;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    extraConfigLua =
      #lua
      ''
        vim.o.timeoutlen = 500
      '';
  };
}
