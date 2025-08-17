{
  globals.mapleader = " ";
  globals.maplocalleader = " ";
  keymaps = [
    # window
    {
      action = "<C-w>";
      key = "<leader>w";
      options = {
        silent = false;
        desc = "Window";
      };
    }
    {
      action = ":nohlsearch<CR>";
      key = "<Esc>";
      options.silent = true;
    }
    {
      action = "G";
      key = "ge";
      options.desc = "End of line";
    }
    {
      action = "<C-w>>";
      key = "<Right>";
    }
    {
      action = "<C-w><";
      key = "<Left>";
    }
    {
      action = "<C-w>+";
      key = "<Up>";
    }
    {
      action = "<C-w>-";
      key = "<Down>";
    }
    {
      mode = [ "i" ];
      action = "<Esc>";
      key = "jk";
      options = {
        silent = true;
        noremap = true;
        desc = "exit mode";
      };
    }
    {
      mode = [ "i" ];
      action = "<Esc>";
      key = "JK";
      options = {
        silent = true;
        noremap = true;
        desc = "exit mode";
      };
    }
  ];
}
# ...
