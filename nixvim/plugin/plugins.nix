# here all the plugins...................
{ pkgs, ... }: {
  # most of the plugins............... they are messed and i will not write any docs..........
  plugins = {
    # lskind for icons.................................
    lspkind = {
      enable = true;
      symbolMap = { Copilot = ""; };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    wtf.enable = true;
    edgy.enable = true;
    # neorg.enable = true;
    # neocord.enable = true;
    tmux-navigator.enable = true;

    friendly-snippets.enable = false;
    # oil.enable = true;
    lazygit.enable = true;
    trim.enable = true;
    nvim-surround.enable = true;

    # dressing.enable = true;
    lualine.enable = true;
    # lightline.enable = true;
    which-key.enable = true;

    noice.enable = true;
    vim-css-color.enable = true;
    notify.enable = true;

    startup.enable = true;
    nvim-colorizer.enable = true;
    leap.enable = true;
    sniprun = {
      enable = true;
      display = [ "Terminal" "VirtualText" ];
      liveModeToggle = "on";
    };
    # commentary.enable = true;
    telescope.enable = true;
    telescope.extensions.file-browser.enable = true;
    telescope.extensions.ui-select.enable = true;
    comment.enable = true;
    twilight.enable = true;
    # nvim-autopairs for like if u open a (, " or like anything like this it will autocomplete it and make it ()"...
    nvim-autopairs = { enable = true; };

    # lsp servers..................................................................

    # cmp settings..............................................................

  };
}
