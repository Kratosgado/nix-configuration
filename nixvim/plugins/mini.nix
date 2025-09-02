{ pkgs, ... }: {

  # Enable mini.nvim with files configuration
  plugins.web-devicons.enable = true;
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
      ai = {
        n_lines = 50;
        search_method = "cover_or_next";
      };
      comment = {
        mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
        };
      };
      # diff = { view = { style = "sign"; }; };
      starter = {
        content_hooks = {
          "__unkeyed-1.adding_bullet" = {
            __raw = "require('mini.starter').gen_hook.adding_bullet()";
          };
          "__unkeyed-2.indexing" = {
            __raw =
              "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
          };
          "__unkeyed-3.padding" = {
            __raw =
              "require('mini.starter').gen_hook.aligning('center', 'center')";
          };
        };
        evaluate_single = true;
        header = ''
          ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
          ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
          ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
          ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
          ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        '';
        items = {
          "__unkeyed-1.buildtin_actions" = {
            __raw = "require('mini.starter').sections.builtin_actions()";
          };
          "__unkeyed-2.recent_files_current_directory" = {
            __raw = "require('mini.starter').sections.recent_files(10, false)";
          };
          "__unkeyed-3.recent_files" = {
            __raw = "require('mini.starter').sections.recent_files(10, true)";
          };
          "__unkeyed-4.sessions" = {
            __raw = "require('mini.starter').sections.sessions(5, true)";
          };
        };
      };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
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
  # extraConfigLua = ''
  #   -- Customize mini.files appearance
  #   require('mini.files').setup({
  #     mappings = {
  #       close = ';;',
  #       go_in = 'l',
  #       go_out = 'h',
  #       reset = '<BS>',
  #       show_help = 'g?',
  #       synchronize = '=',
  #       trim_left = '<',
  #       trim_right = '>',
  #     },
  #     windows = {
  #       preview = true,
  #       width_preview = 80,
  #     }
  #   })
  #
  #   -- Auto-close explorer when last window
  #   vim.api.nvim_create_autocmd('BufLeave', {
  #     pattern = 'minifiles-*',
  #     callback = function(args)
  #       if vim.fn.winnr('$') == 1 then
  #         vim.cmd('quit')
  #       end
  #     end,
  #   })
  # '';
}
