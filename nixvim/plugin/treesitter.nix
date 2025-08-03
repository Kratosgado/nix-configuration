{ lib, config, ... }: {
  plugins = {
    nvim-tree.enable = true;
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        init_options = {
          userLanguages = {
            eelixir = "html-eex";
            eruby = "erb";
            rust = "html";
          };
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "vs";
            node_incremental = "si";
            scope_incremental = "sc";
            node_decremental = "sd";
          };
        };
      };
    };
    treesitter-context.enable = true;
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };
      move = {
        enable = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
      swap = {
        enable = true;
        swapNext = { "<leader>a" = "@parameters.inner"; };
        swapPrevious = { "<leader>A" = "@parameter.outer"; };
      };
    };
    treesitter-refactor.enable = true;
    # rainbow-delimiters.enable = true;
  };
  keymaps = lib.mkIf config.plugins.treesitter-context.enable [{
    mode = "n";
    key = "<leader>uT";
    action = "<cmd>TSContextToggle<cr>";
    options.desc = "Treesitter Context toggle";
  }];
}
