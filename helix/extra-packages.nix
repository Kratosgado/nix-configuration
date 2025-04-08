{ pkgs, ... }: {

  programs.helix.extraPackages = with pkgs; [
    shfmt
    # nodePackages."@prisma/language-server"
    nodePackages."svelte-language-server"
    nodePackages.typescript
    nodePackages."@vue/language-server"
    # vue-language-server

    nodePackages."@tailwindcss/language-server"
    # nodePackages."typescript-svelte-plugin"
    # nodePackages."sql-language-server"
    yaml-language-server
    nodePackages.prettier
    nodePackages."typescript-language-server"
    nodePackages."bash-language-server"
    nodePackages."dockerfile-language-server-nodejs"
    docker-compose-language-service
    pyright
    pylyzer
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
    ruff
    marksman
    rust-analyzer
    clippy
    markdownlint-cli2
    taplo
    # Build tools and utilities
    nixpkgs-fmt
    nixfmt-classic

  ];
}
