{
  globals.mapleader = " ";
  globals.maplocalleader = " ";
  keymaps = [
    # window
    {
      action = "<C-w>";
      key = "<leader>w";
      options.silent = false;
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
      mode = [ "i" "n" "v" "t" ];
      action = "<Esc>";
      key = ";;";
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
      #opening a terminal in neovim
      action = "<cmd>ToggleTerm<CR>";
      key = "<space>t"; # this line is changed
      mode = [ "n" ];
      options = { desc = "open terminal"; };
    }
    {
      # running a single code using SnipRun
      action = "<cmd>SnipRun<CR>";
      key = "<space>r"; # this line is changed
      mode = [ "v" "n" ];
      options = { desc = "run's the selected code"; };
    }
    {
      action = "<cmd>write<CR>";
      key = "<leader>s";
      options = { desc = "save file"; };
    }
    {
      action = "<cmd>quit<CR>";
      key = "<leader>q";
      options = { desc = "exit file"; };
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fs";
      options = { desc = "telescope live_grep"; };
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      options = { desc = "telescope file finding"; };
    }
    {
      action = ":Telescope commands<CR>";
      key = "<leader>fc";
      options.desc = "Search commands";
    }

    {
      action = ":Telescope current_buffer_fuzzy_find<CR>";
      key = "<leader>fb";
      options.desc = "Search current buffer";
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fg";
      options = { desc = "telescope buffer finding"; };
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
