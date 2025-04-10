{
  plugins = {
    snacks = {
      enable = true;
      settings = {
        bigfile = { enabled = true; };
        dashboard = { enabled = true; };
        indent = { enabled = true; };
        input = { enabled = true; };
        picker = { enabled = true; };
        notifier = { enabled = true; };
        quickfile = { enabled = true; };
        scope = { enabled = true; };
        scroll = { enabled = true; };
        lazygit.enabled = true;
        statuscolumn = { enabled = true; };
        words = { enabled = true; };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options.desc = "Open file in browser";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options.desc = "Open lazygit";
    }
  ];
}
