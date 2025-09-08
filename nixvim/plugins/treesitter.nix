{ pkgs, lib, config, ... }:
let
  kulala_http = pkgs.tree-sitter.buildGrammar {
    language = "kulala_http";
    version = pkgs.vimPlugins.kulala-nvim.version;
    src = pkgs.vimPlugins.kulala-nvim.src + "/lua/tree-sitter";
    meta = pkgs.vimPlugins.kulala-nvim.meta;
  };
in {
  plugins = {
    # nvim-tree.enable = true;
    treesitter = {
      enable = true;
      nixvimInjections = true;
      # TODO ckeep this in sync with the grammars
      nixGrammars = true;
      languageRegister = { kulala_http = [ "http" "rest" ]; };

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        asm
        bash
        c
        cmake
        comment
        commonlisp
        kulala_http
        cpp
        css
        csv
        dart
        diff
        dockerfile
        dot
        editorconfig
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
        json
        json5
        jsonc
        kotlin
        # kulala_http
        llvm
        lua
        luadoc
        make
        markdown
        markdown_inline
        nasm
        nginx
        nix
        prisma
        python
        regex
        rust
        scala
        sql
        styled
        superhtml
        svelte
        tmux
        todotxt
        toml
        tsx
        typescript
        typespec
        udev
        vim
        vimdoc
        vue
        xml
        yaml
      ];
      luaConfig.post = ''
         do
          local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
          -- change the following as needed
          parser_config.nu = {
            install_info = {
              url = "${kulala_http}", -- local path or git repo
              files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
              -- optional entries:
              --  branch = "main", -- default branch in case of git repo if different from master
              -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
              -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
            },
            filetype = "http", -- if filetype does not match the parser name
          }
        end
      '';
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
