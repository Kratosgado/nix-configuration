{ pkgs, ... }: {
  extraPlugins = [ pkgs.vimPlugins.fzf-lua ];
  plugins = {
    fzf-lua = {
      enable = false;
      profile = "skim";
      #
      keymaps = {
        "Tab" = "down";

        # {
        #   mode = "n";
        #   key = "<leader>ff";
        #   action = "<cmd>lua require('fzf-lua').files()<cr>";
        #   options.desc = "Find Files";
        # }
        #   {
        #     mode = "n";
        #     key = "<leader>fg";
        #     action = "<cmd>lua require('fzf-lua').live_grep()<cr>";
        #     options.desc = "Live Grep";
        #   }
        #   {
        #     mode = "n";
        #     key = "<leader>fb";
        #     action = "<cmd>lua require('fzf-lua').buffers()<cr>";
        #     options.desc = "Find Buffers";
        #   }
        #   {
        #     mode = "n";
        #     key = "<leader>fh";
        #     action = "<cmd>lua require('fzf-lua').help_tags()<cr>";
        #     options.desc = "Help Tags";
        #   }
      };
    };
    nvim-bqf.enable = true;

    # Disable Telescope
    # telescope.enable = false;

  };
}
