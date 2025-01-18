{
  # Import all your configuration modules here
  programs.nixvim = {
    imports = [
      # ./bufferline.nix
      # ./typescript.nix
      #  ./autocommands.nix
      # ./completion.nix
      # ./keymappings.nix
      # ./options.nix
      # ./plugins
      # ./todo.nix
      ./cmp
      ./lsp
      ./plugin-manager/lazy.nix
      ./ui
      ./plugin
      ./normal-config
      ./other
      ./utils
      # ./debugs
    ];
  };
}
