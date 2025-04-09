{ lib, ... }: {
  plugins.flash = {
    enable = true; # Enable the flash plugin
    settings = {
      # label = {
      #   uppercase = false; # Set label to lowercase
      #   rainbow = {
      #     enabled = false; # Disable rainbow effect
      #     shade = 5; # Shade value
      #   };
      # };
      search = {
        mode = "exact"; # Set search mode to fuzzy
      };
      jump = {
        autojump = true; # Enable autojump
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" "x" "o" ]; # Normal, Visual, Operator-pending modes
      key = "s"; # Key binding for jumping
      action = "lua require('flash').jump()";
      options = { desc = "Flash"; };
    }
    {
      mode = [ "n" "x" "o" ];
      key = "S"; # Key binding for treesitter jumping
      action = "lua require('flash').treesitter()";
      options = { desc = "Flash Treesitter"; };
    }
    {
      mode = "o"; # Operator-pending mode
      key = "r"; # Key binding for remote flash
      action = "lua require('flash').remote()";
      options = { desc = "Remote Flash"; };
    }
    {
      mode = [ "x" "o" ]; # Visual and Operator-pending modes
      key = "R"; # Key binding for treesitter search
      action = "lua require('flash').treesitter_search()";
      options = { desc = "Treesitter Search"; };
    }
  ];
}
