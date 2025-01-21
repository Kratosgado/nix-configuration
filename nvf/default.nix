{
  imports = [./keys.nix ./options.nix ./lsps.nix ./custom];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # extraLuaFiles = [./yew.lua];
        useSystemClipboard = true;
        viAlias = false;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };

        # ui
        theme = {
          name = "tokyonight";
          enable = true;
          style = "night";
        };
        statusline.lualine.enable = true;
        dashboard.alpha.enable = true;
        filetree.neo-tree.enable = true;
        ui = {
          noice.enable = true;

          borders.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn = {
            enable = true;
            # setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            # nix = "110";
            # ruby = "120";
            # java = "130";
            # go = ["90" "130"];
            # };
          };
          fastaction.enable = true;

          borders.plugins.nvim-cmp.enable = true;
        };
        tabline.nvimBufferline = {
          enable = true;
          mappings = {
            moveNext = "<leader>L";
            movePrevious = "<leader>H";
            closeCurrent = "<leader>bd";
            cycleNext = "L";
            cyclePrevious = "H";
          };
        };
        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          cellular-automaton.enable = true;
        };
        utility = {
          surround.enable = true;
          ccc.mappings.quit = ";;";

          # motion.leap.enable = true;
          motion = {
            hop = {
              enable = true;
              mappings.hop = "s";
            };
          };
        };

        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = true;
            cmp.enable = true;
          };
        };

        # terminal
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          mappings = {
            open = "<leader>t";
          };
          setupOpts.enable_winbar = true;
        };
        # maps.terminal = {};
        autopairs.nvim-autopairs.enable = true;
        git = {
          enable = true;
          gitsigns = {
            setupOpts = {
              add.text = "+";
              change.text = "~";
              current_line_blame = true;
            };
          };
        };
        minimap = {
          minimap-vim.enable = false;
          codewindow.enable = true; # lighter, faster, and uses lua for configuration
        };

        notify.nvim-notify.enable = true;
        projects.project-nvim.enable = true;

        telescope = {
          enable = true;
          mappings = {
            buffers = "<leader>fb";
            diagnostics = "<leader>fd";
            gitBranches = "<leader>gb";
            gitCommits = "<leader>gc";
            gitStatus = "<leader>gs";
          };
        };
        notes = {
          obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
          neorg.enable = false;
          orgmode.enable = false;
          mind-nvim.enable = true;
          todo-comments.enable = true;
          todo-comments.mappings.telescope = "<leader>std";
        };
        snippets.luasnip = {
          enable = true;
          providers = ["nvim-treesitter-context" "plenary-nvim"];
        };

        session = {
          nvim-session-manager.enable = false;
        };

        gestures = {
          gesture-nvim.enable = false;
        };

        comments = {
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = false;
        };
      };
    };
  };
}
