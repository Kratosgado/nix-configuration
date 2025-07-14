{ pkgs, ... }: {
  plugins = {
    smear-cursor = {
      enable = true;
      package = pkgs.vimPlugins.smear-cursor-nvim;
    };
    visual-multi = { enable = true; };
  };
}
