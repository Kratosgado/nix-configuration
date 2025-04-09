{
  plugins = {
    telescope = {
      enable = true;
      keymaps = {
        "<leader>," = {
          action = "buffers sort_mru=true sort_lastused=true";
          options.desc = "Switch Buffer";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Grep (Root Dir)";
        };
        "<leader>:" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader><space>" = {
          action = "find_files";
          options.desc = "Find Files (Root Dir)";
        };

        # Find mappings
        "<leader>fb" = {
          action =
            "buffers sort_mru=true sort_lastused=true ignore_current_buffer=true";
          options.desc = "Buffers";
        };
        "<leader>fc" = {
          action = "config_files";
          options.desc = "Find Config File";
        };
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find Files (Root Dir)";
        };
        "<leader>fF" = {
          action = "find_files";
          # options.__raw = "{ root = false }";
          options.desc = "Find Files (cwd)";
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
          # options.__raw = "{ cwd = vim.uv.cwd() }";
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
          action = "autocommands";
          options.desc = "Auto Commands";
        };
        "<leader>sb" = {
          action = "current_buffer_fuzzy_find";
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
          action = "diagnostics bufnr=0";
          options.desc = "Document Diagnostics";
        };
        "<leader>sD" = {
          action = "diagnostics";
          options.desc = "Workspace Diagnostics";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "Grep (Root Dir)";
        };
        "<leader>sG" = {
          action = "live_grep";
          # options.__raw = "{ root = false }";
          options.desc = "Grep (cwd)";
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
          action = "jumplist";
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
        "<leader>so" = {
          action = "vim_options";
          options.desc = "Options";
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
          action = "grep_string";
          # options.__raw = "{ word_match = '-w' }";
          options.desc = "Word (Root Dir)";
        };
        "<leader>sW" = {
          action = "grep_string";
          # options.__raw = "{ root = false, word_match = '-w' }";
          options.desc = "Word (cwd)";
        };
        "<leader>uC" = {
          action = "colorscheme";
          # options.__raw = "{ enable_preview = true }";
          options.desc = "Colorscheme with Preview";
        };
        "<leader>ss" = {
          action = "lsp_document_symbols";
          # options.__raw = ''
          #   {
          #               symbols = require("lazyvim.config").get_kind_filter(),
          #             }'';
          options.desc = "Goto Symbol";
        };
        "<leader>sS" = {
          action = "lsp_dynamic_workspace_symbols";
          # options.__raw = ''
          #   {
          #               symbols = require("lazyvim.config").get_kind_filter(),
          #             }'';
          options.desc = "Goto Symbol (Workspace)";
        };
      };
      extensions = {
        file-browser.enable = true;
        ui-select.enable = true;
        fzf-native.enable = true;
        project.enable = true;
      };
    };

  };
}
