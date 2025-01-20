{
  programs.nvf.settings.vim = {
    binds = {
      whichKey = {
        enable = true;
        register = {"<leader>l" = "Lsp actions";};
      };
    };
    keymaps = [
      {
        key = ";;";
        mode = ["i" "n" "t" "x" "v"];
        silent = true;
        noremap = true;
        action = "<Esc>";
      }
      {
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        mode = "n";
        silent = true;
      }
      {
        key = "<leader>w";
        action = ":w!<CR>";
        mode = "n";
        silent = true;
      }
    ];
  };
}
