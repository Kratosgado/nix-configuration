{ pkgs, ... }: {
  home.packages = with pkgs; [
    svelte-language-server
    typescript-language-server
    nodePackages."@prisma/language-server"
    nodePackages."wrangler"
    tailwindcss-language-server
    kotlin-language-server
    nodePackages."vscode-langservers-extracted"
    lua-language-server
    rustfmt
    jdt-language-server
    ruff
    kotlin
    jdk
    gradle
    maven
    
    # Build tools and utilities
    nixpkgs-fmt
    # Debugging tools
    # jdb
    # visualvm
    
    # Additional tools
    # rnix-lsp        # For Nix files
    nil             # Nix language server
    pyright
    ktlint
    vtsls
    marksman
    markdownlint-cli2 
    clippy
    rustc
    cargo
    rust-analyzer
       pkg-config

    vimPlugins.none-ls-nvim # vimPlugins.nvim-lspconfig
    stylua
  ];
  
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    # coc.enable = true;
    # withNodeJs = true;

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
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}";
    # This forces kotlin-language-server to use the correct JDK
    KOTLIN_LANGUAGE_SERVER_JAVA_HOME = "${pkgs.jdk}";
  };

}
