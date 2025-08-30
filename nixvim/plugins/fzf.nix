{ pkgs, ... }: {
  extraPlugins = [ pkgs.vimPlugins.fzf-lua ];
  plugins = {
    fzf-lua = {
      enable = true;
      profile = "skim";
      settings = {
        # winopts = { }; # UI Options
        keymap = { fzf = { "Tab" = "down"; }; }; # Neovim keymaps / fzf binds
        # actions = {  }; # Fzf "accept" binds
        # fzf_opts = { }; # Fzf CLI flags
        # fzf_colors = { }; # Fzf `--color` specification
        # hls = { }; # Highlights
        # previewers = { }; # Previewers options
      };
      #
      keymaps = {
        # "<leader>st" = {
        #   action = "todo-comments";
        #   options.desc = "View Todo";
        # };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Grep (Root Dir)";
        };
        "<leader>:" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader><space>" = {
          action = "files";
          options.desc = "Find Files (Root Dir)";
        };

        # Find mappings
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Buffers";
        };
        "<leader>fc" = {
          action = "config_files";
          options.desc = "Find Config File";
        };
        "<leader>ff" = {
          action = "files";
          options.desc = "Find Files (Root Dir)";
        };
        "<leader>fg" = {
          action = "git_files";
          options.desc = "Find Files (git-files)";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent";
        };
        "<leader>fR" = {
          action = "oldfiles";
          options.desc = "Recent (cwd)";
        };

        # Git mappings
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Status";
        };

        # Search mappings
        "<leader>s\"" = {
          action = "registers";
          options.desc = "Registers";
        };
        "<leader>sa" = {
          action = "autocmds";
          options.desc = "Auto Commands";
        };
        "<leader>sb" = {
          action = "grep_curbuf";
          options.desc = "Buffer";
        };
        "<leader>sc" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>sC" = {
          action = "commands";
          options.desc = "Commands";
        };
        "<leader>sd" = {
          action = "diagnostics_document";
          options.desc = "Document Diagnostics";
        };
        "<leader>sD" = {
          action = "diagnostics_workspace";
          options.desc = "Workspace Diagnostics";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "Grep (Root Dir)";
        };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help Pages";
        };
        "<leader>sH" = {
          action = "highlights";
          options.desc = "Search Highlight Groups";
        };
        "<leader>sj" = {
          action = "jumps";
          options.desc = "Jumplist";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "Key Maps";
        };
        "<leader>sl" = {
          action = "loclist";
          options.desc = "Location List";
        };
        "<leader>sM" = {
          action = "man_pages";
          options.desc = "Man Pages";
        };
        "<leader>sm" = {
          action = "marks";
          options.desc = "Jump to Mark";
        };
        "<leader>sR" = {
          action = "resume";
          options.desc = "Resume";
        };
        "<leader>sq" = {
          action = "quickfix";
          options.desc = "Quickfix List";
        };
        "<leader>sw" = {
          action = "grep_cword";
          options.desc = "Word (Root Dir)";
        };
        "<leader>uC" = {
          action = "colorschemes";
          options.desc = "Colorscheme with Preview";
        };
        "<leader>ss" = {
          action = "lsp_document_symbols";
          options.desc = "Goto Symbol";
        };
        "<leader>sS" = {
          action = "lsp_workspace_symbols";
          options.desc = "Goto Symbol (Workspace)";
        };
      };
    };
    nvim-bqf.enable = true;
  };
}
