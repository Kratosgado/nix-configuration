{ pkgs, config, ... }:

{
  plugins.bufferline = {
    enable = true;
    settings.options.alwaysShowBufferline = false;
  };
  keymaps = [
    {
      mode = "n";
      key = "L";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = { desc = "Cycle to next buffer"; };
    }
    {
      mode = "n";
      key = "H";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = { desc = "Cycle to previous buffer"; };
    }

    {
      mode = "n";
      key = "<leader>bj";
      action = "<cmd>BufferLinePick<cr>";
      options.desc = "Jump to buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = { desc = "Delete buffer"; };
    }
    {
      mode = "n";
      key = "M";
      action = "<cmd>BufferLineMoveNext<cr>";
      options = { desc = "Move Buffer right"; };
    }
    {
      mode = "n";
      key = "N";
      action = "<cmd>BufferLineMovePrev<cr>";
      options = { desc = "Move Buffer left"; };
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options = { desc = "Switch to Other Buffer"; };
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = { desc = "Delete buffers to the right"; };
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = { desc = "Delete buffers to the left"; };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = { desc = "Delete other buffers"; };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = { desc = "Toggle pin"; };
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = { desc = "Delete non-pinned buffers"; };
    }
    {
      mode = "n";
      key = "<leader>bsd";
      action = "<Cmd>BufferLineSortByDirectory<cr>";
      options = { desc = "Delete non-pinned buffers"; };
    }
    {
      mode = "n";
      key = "<leader>bse";
      action = "<Cmd>BufferLineSortByExtension<cr>";
      options = { desc = "Delete non-pinned buffers"; };
    }
  ];
}
