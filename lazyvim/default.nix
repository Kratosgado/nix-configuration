{ pkgs, ... }: {
  home.packages = with pkgs; [
    svelte-language-server
    nodePackages."@prisma/language-server"
    nodePackages."wrangler"
    tailwindcss-language-server
    nodePackages."vscode-langservers-extracted"
    lua-language-server
    rustfmt
    ruff
    nil
    pyright
    nixd
    vtsls
    marksman
    markdownlint-cli2 
    clippy
    rustc
    cargo
    rust-analyzer
    pkg-config

    vimPlugins.none-ls-nvim # vimPlugins.nvim-lspconfig
  ];
  
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    # coc.enable = true;
    withNodeJs = true;

    # extraConfig = ''
    #   set runtimePath=/etc/xdg/nvim/,$VIMRUNTIME,${pkgs.neovim-unwrapped}/lib/nvim
    #   set runtimePath^=${pkgs.vimPlugins.lazy-nvim}
    #   set runtimePath^=${treesitterParserPath}
    #   let g:lazyPluginPath = "${lazyPluginPath}"
    # '';
  };
  #
  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

}
