{
  plugins = {
    gitblame.enable = true;
    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
        current_line_blame = true;
      };
    };
  };
}
