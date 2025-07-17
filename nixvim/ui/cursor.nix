{ pkgs, ... }: {
  plugins = {
    smear-cursor = {
      enable = false;
      package = pkgs.vimPlugins.smear-cursor-nvim;
    };
    visual-multi = { enable = true; };
  };
}
