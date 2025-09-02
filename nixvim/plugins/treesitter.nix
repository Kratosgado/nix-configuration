{ pkgs, lib, config, ... }: {
  plugins = {
    nvim-tree.enable = true;
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        asm
        c
        cpp
        css
        lua
        csv
        dart
        dot
        dockerfile
        diff
        git_config
        git_rebase
        gitattributes
        gitcommit
        gitignore
        graphql
        groovy
        html
        http
        java
        javadoc
        javascript
        jq
        jsdoc
        kotlin
        latex
        llvm
        make
        nasm
        nginx
        prisma
        proto
        python
        regex
        rust
        scss
        sql
        ssh_config
        styled
        svelte
        superhtml
        tmux
        todotxt
        toml
        tsx
        typescript
        vue
        cmake
        comment
        commonlisp
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
      settings = {
        auto_install = true;
        ensure_installed = [
          "git_config"
          "kulala_http"
          "git_rebase"
          "gitattributes"
          "gitcommit"
          "gitignore"
        ];
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
