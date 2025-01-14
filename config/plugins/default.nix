{
  imports = [
    # ./barbar.nix
    # ./comment.nix
    # ./gitblame.nix
    # ./harpoon.nix
    # ./indent-o-matic.nix
    # ./lazygit.nix
    ./lint.nix
    ./lsp.nix
    # ./lualine.nix
    # ./markdown-preview.nix
    # ./nix.nix
    # ./noice.nix
    # ./oil.nix
    # ./tagbar.nix
    ./telescope.nix
    ./tree-sitter.nix
    # ./which-key.nix
    # ./web-devicons.nix
  ];

  programs.nixvim = {
    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          transparent_mode = false;
  day_brightness = 0.3;
  dim_inactive = false;
  hide_inactive_statusline = false;
  light_style = "day";
  lualine_bold = false;
  on_colors = "function(colors) end";
  on_highlights = "function(highlights, colors) end";
  sidebars = [
    "qf"
    "vista_kind"
    "terminal"
    "packer"
  ];
  style = "storm";
  styles = {
    comments = {
      italic = true;
    };
    floats = "dark";
    functions = { };
    keywords = {
      italic = true;
    };
    sidebars = "dark";
    variables = { };
  };
  terminal_colors = true;
  transparent = false;
        };
      };

      vscode = {
        enable = false;
        settings = {
        integrations = {
	  italic_comments = true;
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
	  underline_links = true;
          notify = false;
          };
        };
      };
      kanagawa = {
        enable = false;
        settings = {
          colors = {
            palette = {
              fujiWhite = "#FFFFFF";
              sumiInk0 = "#000000";
            };
            theme = {
              all = {
                ui = {
                  bg_gutter = "none";
                };
              };
              dragon = {
                syn = {
                  parameter = "yellow";
                };
              };
              wave = {
                ui = {
                  float = {
                    bg = "none";
                  };
                };
              };
            };
          };
          commentStyle = {
            italic = true;
          };
          compile = false;
          dimInactive = false;
          functionStyle = { };
          overrides = "function(colors) return {} end";
          terminalColors = true;
          theme = "wave";
          transparent = false;
          undercurl = true;
        };
      };
    };

    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      transparent.enable = true;

      web-devicons.enable = true;

      nvim-autopairs.enable = true;
      none-ls.enable = true;
      nvim-surround.enable = true;

      trim = {
        enable = true;
        settings = {
          highlight = false;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
