{
  programs.nvf.settings.vim = {
    binds = {
      whichKey = {
        enable = true;
        register = {"<leader>l" = "Lsp actions";};
      };
      cheatsheet.enable = true;
    };
    keymaps = [
      # random

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
        desc = "Save file";
        key = "<leader>s";
        action = ":w!<CR>";
        mode = "n";
        silent = true;
      }

      # Window
      {
        key = "<leader>w";
        action = "<C-W>";
        mode = "n";
      }
      {
        key = "<Right>";
        action = "<C-w>>";
        mode = "n";
      }
      {
        key = "<Left>";
        action = "<C-w><";
        mode = "n";
      }
      {
        key = "<Up>";
        action = "<C-w>+";
        mode = "n";
      }
      {
        key = "<Down>";
        action = "<C-w>-";
        mode = "n";
      }

      # BuffLine
      {
        desc = "Close other buffers";
        key = "<leader>bo";
        action = ":BufferLineCloseOthers<cr>";
        mode = "n";
        silent = true;
      }
      {
        desc = "Close right buffers";
        key = "<leader>bh";
        action = ":BufferLineCloseLeft<cr>";
        mode = "n";
        silent = true;
      }
      {
        desc = "Close left buffers";
        key = "<leader>bl";
        action = ":BufferLineCloseLeft<cr>";
        mode = "n";
        silent = true;
      }
      {
        desc = "Toggle buffer pin";
        key = "<leader>bp";
        action = ":BufferLineTogglePin<cr>";
        mode = "n";
        silent = true;
      }
    ];
  };
}
