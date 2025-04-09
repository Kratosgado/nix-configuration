{ pkgs, ... }: {
  plugins = {
    smear-cursor = {
      enable = true;
      package = pkgs.vimPlugins.smear-cursor-nvim;
    };
    multicursors = {
      enable = true;
      normalKeys = {
        # Selection
        # "<C-n>" = "next_match";
        # "<C-p>" = "prev_match";
        # "<C-x>" = "skip_match";
        # "<C-A-n>" = "select_all";

        # Navigation
        # "<Left>" = "move_left";
        # "<Right>" = "move_right";
        # "<Up>" = "move_up";
        # "<Down>" = "move_down";
        #
        # Editing
        # "c" = "change";
        # "d" = "delete";
        # "y" = "yank";
      };

      # insertKeys = {
      #   "<BS>" = "backspace";
      #   "<C-h>" = "backspace";
      #   "<CR>" = "carriage_return";
      # };
    };
  };
}
