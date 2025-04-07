{
  programs.nixvim = {
    # Keymaps
    keymaps = [

      # markdown preview mapping
      {
        action = ":MarkdownPreview<CR>";
        key = "<leader>pm";
        options = {
          silent = true;
          noremap = true;
          desc = "Open markdown preview in browser";
        };
      }
      # Telescope diagnostics
      {
        action = ":Telescope diagnostics<CR>";
        key = "<leader>d";
        options.desc = "Diagnostics";
      }
      # Telescope quickfixlist
      {
        action = ":Telescope quickfix<CR>";
        key = "<leader>ql";
        options = { desc = "Quickfix list"; };
      }
      # Diffview open comparing in git
      {
        action = ":DiffviewOpen<CR>";
        key = "<leader>do";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview open";
        };
      }
      # Diffview close comparing in git
      {
        action = ":DiffviewClose<CR>";
        key = "<leader>dp";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview close";
        };
      }
    ];
  };
}
