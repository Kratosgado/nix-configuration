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
    helix
    taplo
    
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
  
  programs.helix = {
  enable = true;
    defaultEditor = true;
  settings = {
    theme = "tokyonight";
    editor = {
        cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
      };
  };
  languages = {
      language = [{
    name = "nix";
    auto-format = true;
    formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
  }
        {name = "rust";}
        
        {name = "cpp";}

{ name = "java"; }
{ name = "kotlin"; }
{ name = "svelte"; }
{ name = "gts"; }
{ name = "prisma"; }
{ name = "python"; }
{ name = "toml"; }
{ name = "dockerfile"; }
{ name = "docker-compose"; }
{ name = "env"; }
        {name = "bash";}
        {name = "html";}
        {name = "css";}
        {name = "lua";}
        {name = "json";}
        {name = "markdown";}
        {name = "sql";}
      ];
    };
  themes = {
    autumn_night_transparent = {
      "inherits" = "autumn_night";
      "ui.background" = { };
    };
  };
};
  #
  # home.file."./.config/helix/" = {
  #   source = ./helix;
  #   recursive = true;
  # };
  
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}";
    # This forces kotlin-language-server to use the correct JDK
    KOTLIN_LANGUAGE_SERVER_JAVA_HOME = "${pkgs.jdk}";
  };

}
