{
  imports = [./keys.nix ./lsps.nix];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          name = "tokyonight";
          enable = true;
          style = "night";
        };
        statusline.lualine.enable = true;
        dashboard.alpha.enable = true;
        filetree.neo-tree.enable = true;
        ui.noice.enable = true;
        viAlias = false;
        vimAlias = true;

        git.gitsigns.enable = true;
        git.gitsigns.codeActions.enable = true;
        telescope = {
          enable = true;
          mappings = {
            buffers = "<leader>fb";
            diagnostics = "<leader>fd";
          };
        };
        notes.todo-comments.mappings.telescope = "<leader>std";
        snippets.luasnip = {
          enable = true;
          providers = ["nvim-treesitter-context" "obsidian-nvim" "trouble" "plenary-nvim"];
        };
      };
    };
  };
}
