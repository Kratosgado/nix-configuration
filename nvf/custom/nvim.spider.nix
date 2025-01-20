{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "nvim-spider" = {
      package = pkgs.vimPlugins.nvim-spider;
      setupModule = "nvim-spider";
      lazy = false;
      event = ["BufEnter"];
      keys = [
        {
          key = "W";
          action = "<cmd>lua require('spider').motion('w')<CR>";
          mode = ["n" "o" "x"];
          desc = "Move to the start of the next word";
        }
        {
          key = "e";
          action = "<cmd>lua require('spider').motion('e')<CR>";
          mode = ["n" "o" "x"];
          desc = "Move to end of word";
        }
        {
          key = "b";
          action = "<cmd>lua require('spider').motion('b')<CR>";
          mode = ["n" "o" "x"];
          desc = "Move to start of previous word";
        }
      ];
    };
  };
}
