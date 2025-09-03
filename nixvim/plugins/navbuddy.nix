{
  plugins.navbuddy = {
    enable = true;
    lsp.autoAttach = true;
    mappings = {
      "0" = "root";
      "<C-s>" = "hsplit";
      "<C-v>" = "vsplit";
      "<enter>" = "select";
      "<esc>" = "close";
      A = "append_scope";
      F = "fold_delete";
      I = "insert_scope";
      J = "move_down";
      K = "move_up";
      V = "visual_scope";
      Y = "yank_scope";
      a = "append_name";
      c = "comment";
      d = "delete";
      f = "fold_create";
      h = "parent";
      i = "insert_name";
      j = "next_sibling";
      k = "previous_sibling";
      l = "children";
      o = "select";
      q = "close";
      r = "rename";
      s = "toggle_preview";
      v = "visual_name";
      y = "yank_name";
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>se";
    action = "<cmd>Navbuddy<cr>";
    options = { desc = "Navbuddy"; };
  }];
}
