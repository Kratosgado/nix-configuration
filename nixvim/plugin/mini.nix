{ pkgs, ... }: {

  # Enable mini.nvim with files configuration
  plugins.mini = {
    enable = true;
    modules = {
      git = {
        enable = true;
        delay = 100;
      };
      files = {
        options = {
          use_as_default_explorer = true;
          permanent_delete = false;
        };
        windows = {
          preview = true;
          width_preview = 80;
        };
      };
    };
  };

  # Add keymaps for mini.files
  keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>lua require('mini.files').open()<cr>";
      options = {
        desc = "Open file explorer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action =
        "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0))<cr>";
      options = {
        desc = "Reveal current file";
        silent = true;
      };
    }
  ];

  # Optional: Add custom configuration for mini.files
  extraConfigLua = ''
    -- Customize mini.files appearance
    require('mini.files').setup({
      mappings = {
        close = ';;',
        go_in = 'l',
        go_out = 'h',
        reset = '<BS>',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      windows = {
        preview = true,
        width_preview = 80,
      }
    })

    -- Auto-close explorer when last window
    vim.api.nvim_create_autocmd('BufLeave', {
      pattern = 'minifiles-*',
      callback = function(args)
        if vim.fn.winnr('$') == 1 then
          vim.cmd('quit')
        end
      end,
    })
  '';
}
