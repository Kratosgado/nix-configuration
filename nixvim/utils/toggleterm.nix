{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 30
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
      open_mapping = "[[<C-/>]]";
      shell = "zsh";
    };
  };

  keymaps = [
    {
      mode = "t";
      key = "jk";
      action = "<C-\\><C-n>";
      options = {
        silent = true;
        noremap = true;
        desc = "Exit terminal mode";
      };
    }
    {
      mode = [ "t" "n" ];
      key = "<C-g>";
      action = "<cmd>2ToggleTerm<cr>";
      options.desc = "Open/Close Terminal 2";
    }
    {
      mode = [ "t" "n" ];
      key = "<C-Left>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Go to Left window";
    }
    {
      mode = [ "t" "n" ];
      key = "<C-Right>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Go to Right window";
    }
    {
      mode = [ "t" "n" ];
      key = "<C-Up>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Go to Up window";
    }
    {
      mode = [ "t" "n" ];
      key = "<C-Down>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Go to Down window";
    }
  ];
}
