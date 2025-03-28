{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    ruff
    kotlin
    jdk
    gradle
    maven
    # Debugging tools
    # jdb
    # visualvm

    # Additional tools
    # rnix-lsp        # For Nix files
    clippy
    rustc
    cargo
    rust-analyzer
    pkg-config

    vimPlugins.none-ls-nvim # vimPlugins.nvim-lspconfig
    stylua
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    settings = {
      theme = "tokyonight";
      editor = {

        cursorline = true;
        completion-replace = true;
        true-color = true;
        bufferline = "always";
        color-modes = true;
        popup-border = "all";
        auto-save.focus-lost = true;
        indent-guides.render = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        lsp = {
          display-inlay-hints = true;
          display-progress-messages = true;
        };
        statusline = {

          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
      };
      keys = {
        insert = {
          j = { k = "normal_mode"; };
          "S-space" = "completion";
        };
        normal = {
          H = "goto_previous_buffer";
          L = "goto_next_buffer";
          K = "hover";
          g = { c = "toggle_comments"; };
          space = {
            b = {
              d = ":bc!";
              o = ":bco!";
              b = "buffer_picker";
            };
          };
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        { name = "rust"; }
        {
          name = "typescript";
          auto-format = true;
        }
        # { name = "cpp"; }
        { name = "java"; }
        { name = "kotlin"; }
        {
          name = "svelte";
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [ "--parser=svelte" ];
          };
        }
        {
          name = "gts";
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [ "--parser=typescript" ];
          };
        }
        {
          name = "prisma";
          auto-format = true;
        }
        {
          name = "python";
          formatter.command = "black";
        }
        { name = "toml"; }
        { name = "dockerfile"; }
        { name = "docker-compose"; }
        { name = "env"; }
        {
          name = "bash";
          formatter = {
            command = "shfmt";
            args = [ "-i" "2" "-ci" ];
          };
        }
        { name = "html"; }
        { name = "css"; }
        { name = "lua"; }
        { name = "json"; }
        { name = "markdown"; }
        { name = "sql"; }
      ];
    };
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
    extraPackages = with pkgs; [
      svelte-language-server
      typescript-language-server
      nodePackages."@prisma/language-server"
      tailwindcss-language-server
      kotlin-language-server
      nodePackages."vscode-langservers-extracted"
      lua-language-server
      rustfmt
      jdt-language-server
      nil # Nix language server
      pyright
      ktlint
      vtsls
      marksman
      markdownlint-cli2
      taplo
      # Build tools and utilities
      nixpkgs-fmt
    ];

  };

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}";
    # This forces kotlin-language-server to use the correct JDK
    KOTLIN_LANGUAGE_SERVER_JAVA_HOME = "${pkgs.jdk}";
  };
}
