{ pkgs, ... }: {
  plugins = {
    # lskind for icons.................................
    lspkind = {
      enable = true;

      cmp.menu = {
        nvim_lsp = "";
        nvim_lua = "";
        neorg = "[neorg]";
        buffer = "";
        calc = "";
        git = "";
        luasnip = "󰩫";
        codeium = "󱜙";
        copilot = "";
        emoji = "󰞅";
        path = "";
        spell = "";
      };

      symbolMap = {
        Namespace = "󰌗";
        Text = "󰊄";
        Method = "󰆧";
        Function = "󰡱";
        Constructor = "";
        Field = "󰜢";

        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "󰕳";
        Property = "";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈚";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TypeParameter = "";
        Table = "";
        Object = "󰅩";
        Tag = "";
        Array = "[]";
        Boolean = "";
        Number = "";
        Null = "󰟢";
        String = "󰉿";
        Calendar = "";
        Watch = "󰥔";
        Package = "";
        Copilot = "";
        Codeium = "";
        TabNine = "";
      };

      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
    codesnap = {
      enable = true;
      settings = {
        breadcrumbs_separator = "/";
        has_breadcrumbs = true;
        has_line_number = false;
        mac_window_bar = true;
        save_path = "~/Pictures/codesnaps/";
        bg_theme = "grape";
        title = "CodeSnap.nvim";
        watermark = "Kratosgado";
      };
    };

    wtf.enable = true;
    edgy.enable = true;

    trim.enable = true;
    nvim-surround.enable = true;
    lualine.enable = true;
    # lightline.enable = true;

    noice.enable = true;
    vim-css-color.enable = true;
    notify.enable = true;

    colorizer.enable = true;
    sniprun = {
      enable = true;
      settings = {
        display = [ "Terminal" "VirtualText" ];
        live_mode_toggle = "on";
      };
    };
    # commentary.enable = true;
    comment.enable = true;
    twilight.enable = true;
    # nvim-autopairs for like if u open a (, " or like anything like this it will autocomplete it and make it ()"...
    nvim-autopairs = { enable = true; };
  };
}
