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
      # execute currunt file of python in terminal
      action = "<cmd>term python3 %<CR>";
      key = "<F8>"; # this line is changed
      mode = [ "n" ];
      options = { desc = "runs currunt python file in the terminal"; };
    }
    {
      # Neoformat
      action = "<cmd>Neoformat<CR>";
      key = "<space>="; # this line is changed
      mode = [ "n" ];
      options = { desc = "formatting"; };
    }

    {
      # running a single code using SnipRun
      action = "<cmd>SnipRun<CR>";
      key = "<space>r"; # this line is changed
      mode = [ "v" "n" ];
      options = { desc = "run's the selected code"; };
    }

    {
      action = "<cmd>bd#<CR>";
      key = "<leader>cb";
      options = { desc = "killing opened output buffer"; };
    }

    # for neorg
    {
      action = "<cmd>Neorg<CR>";
      key = "<leader>o";
      options = { desc = "opening neorg with telesope"; };
    }
  ];
}
# ...
