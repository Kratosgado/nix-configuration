{ lib, ... }: {
  plugins.flash = {
    enable = true; # Enable the flash plugin
    settings = {
      # label = {
      #   # uppercase = false; # Set label to lowercase
      #   rainbow.enabled = true;
      # };
      # labels = "asdfghjklqwertyuiopzxcvbnm"; # Define labels
      search = {
        mode = "exact"; # Set search mode to fuzzy
      };
      modes = {
        char = {
          jump_labels = true;
          jump.autojump = true;
        };
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" "x" "o" ]; # Normal, Visual, Operator-pending modes
      key = "s"; # Key binding for jumping
      action = "<cmd>lua require('flash').jump()<cr>";
      options = { desc = "Flash"; };
    }
    {
      mode = [ "n" "x" "o" ];
      key = "S"; # Key binding for treesitter jumping
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options = { desc = "Flash Treesitter"; };
    }
    {
      mode = "o"; # Operator-pending mode
      key = "r"; # Key binding for remote flash
      action = "<cmd>lua require('flash').remote()<cr>";
      options = { desc = "Remote Flash"; };
    }
    {
      mode = [ "x" "o" ]; # Visual and Operator-pending modes
      key = "R"; # Key binding for treesitter search
      action = "<cmd>lua require('flash').treesitter_search()<cr>";
      options = { desc = "Treesitter Search"; };
    }

  ];
}
