{
  plugins.neogit = {
    enable = true;
    settings = {
      popup.kind = "floating";
      integrations.fzf-lua = true;
      integrations.diffview = true;
      commit_editor.kind = "floating";
      commit_select_view.kind = "floating";
      commit_view.kind = "floating";
      log_view.kind = "floating";
      description_editor.kind = "floating";
      reflog_view.kind = "floating";
      tag_editor.kind = "floating";
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Neogit<cr>";
      options = { desc = "Neogit Status"; };
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Neogit commit<cr>";
      options = { desc = "Neogit Commit"; };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Neogit blame_line<cr>";
      options = { desc = "Neogit Blame"; };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Neogit diff<cr>";
      options = { desc = "Neogit Diff"; };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Neogit reflog<cr>";
      options = { desc = "Neogit Reflog"; };
    }
    {
      mode = "n";
      key = "<leader>gm";
      action = "<cmd>Neogit merge<cr>";
      options = { desc = "Neogit Merge"; };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Neogit pull<cr>";
      options = { desc = "Neogit Pull"; };
    }
  ];
}
