{ pkgs, ... }: {
  plugins = {
    smear-cursor = {
      enable = true;
      package = pkgs.vimPlugins.smear-cursor-nvim;
    };
    multicursors = { enable = true; };
  };
}
