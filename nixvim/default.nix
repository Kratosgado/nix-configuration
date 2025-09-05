{ pkgs, ... }: {
  # Import all your configuration modules here
  programs.nixvim = {
    imports = [
      ./cmp
      ./lsp
      ./plugin-manager/lazy.nix
      ./ui
      ./plugins
      ./normal-config
      ./utils
      ./debugs
    ];
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}
