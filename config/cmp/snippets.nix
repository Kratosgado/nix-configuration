{ ... }: {
  plugins.luasnip = {
    enable = true;
    filetypeExtend = { lua = [ "c" "cpp" ]; };
    # lazyLoad.enable = true;
    # extraConfig = {
    #   enable_autosnippets = true;
    #   # store_selection_keys = "<Tab>";
    # };
  }; # not configured

  # snippet configurations
  # extraConfigLua = builtins.readFile ./config.lua;

}
