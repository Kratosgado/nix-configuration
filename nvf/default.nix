{
  imports = [./keys.nix ./options.nix ./lsps.nix ./custom];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # extraLuaFiles = [./yew.lua];
        useSystemClipboard = true;
        # ui
        theme = {
          name = "tokyonight";
          enable = true;
          style = "night";
        };
        statusline.lualine.enable = true;
        dashboard.alpha.enable = true;
        filetree.neo-tree.enable = true;
        ui.noice.enable = true;
        ui.borders.plugins.nvim-cmp.enable = true;
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
        visuals.indent-blankline.enable = true;
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
        viAlias = false;
        vimAlias = true;

        # terminal
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          mappings = {
            open = "<leader>t";
          };
          setupOpts.enable_winbar = true;
        };
        maps.terminal = {};
        autopairs.nvim-autopairs.enable = true;

        git.gitsigns = {
          setupOpts = {
            add.text = "+";
            change.text = "~";
            current_line_blame = true;
          };
        };
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
        notes.todo-comments.mappings.telescope = "<leader>std";
        snippets.luasnip = {
          enable = true;
          providers = ["nvim-treesitter-context" "plenary-nvim"];
        };
      };
    };
  };
}
