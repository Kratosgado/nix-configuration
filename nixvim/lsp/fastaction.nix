{ lib, config, ... }: {
  plugins.fastaction = {
    enable = true;
    settings = {
      dismiss_keys = [ "j" "k" "<c-c>" "q" ];
      keys = "qwertyuiopasdfghlzxcvbnm";
      popup = {
        border = "rounded";
        hide_cursor = true;
        highlight = {
          divider = "FloatBorder";
          key = "MoreMsg";
          title = "Title";
          window = "NormalFloat";
        };
        title = "Select one of:";
      };
      priority = {
        dart = [
          {
            key = "o";
            order = 1;
            pattern = "organize import";
          }
          {
            key = "x";
            order = 2;
            pattern = "extract method";
          }
          {
            key = "e";
            order = 3;
            pattern = "extract widget";
          }
        ];
      };
      register_ui_select = false;
    };
  };

  keymaps = lib.mkIf config.plugins.fastaction.enable [
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>lua require('fastaction').code_action()<cr>";
      options = { desc = "Fastaction code action"; };
    }
    {
      mode = "v";
      key = "<leader>cc";
      action = "<cmd>lua require('fastaction').range_code_action()<cr>";
      options = { desc = "Fastaction code action"; };
    }
  ];
}
