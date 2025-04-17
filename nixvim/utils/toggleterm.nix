{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[]]";
      shell = "zsh";
    };
  };

  keymaps = [{
    mode = "t";
    key = "jk";
    action = "<C-\\><C-n>";
    options = {
      silent = true;
      noremap = true;
      desc = "Exit terminal mode";
    };
  }];
}
