{
  plugins = {
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-T>]]";
        shell = "zsh";
      };
      lazyLoad = {
        settings = {
          cmd = "ToggleTerm";
          keys = [ "<leader>tg" ];
        };
      };
    };
    tmux-navigator.enable = true;
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
