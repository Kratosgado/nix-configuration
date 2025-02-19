{ pkgs, ... }:
let
  lazyPkgs.all.start = with pkgs.vimPlugins; [
    CopilotChat-nvim
    LazyVim
    # luaSnip
    cmp_luasnip
    SchemaStore-nvim
    bufferline-nvim
    cmake-tools-nvim
    cmp-buffer
    vim-illuminate
    cmp-git
    vim-svelte
    cmp-nvim-lsp
    cmp-path
    conform-nvim
    copilot-cmp
    copilot-lua
    crates-nvim
    dial-nvim
    flash-nvim
    friendly-snippets
    fzf-lua
    git-conflict-nvim
    grug-far-nvim
    kulala-nvim
    lazy-nvim
    lazydev-nvim
    markdown-preview-nvim
    mini-ai
    mini-comment
    mini-diff
    mini-files
    mini-icons
    mini-move
    mini-pairs
    mini-starter
    mini-surround
    noice-nvim
    nui-nvim
    nvim-cmp
    nvim-jdtls
    nvim-lint
    nvim-lspconfig
    nvim-snippets
    none-ls-nvim
    nvim-spider
    nvim-treesitter-textobjects
    nvim-treesitter-context
    nvim-ts-autotag
    nvim-ts-context-commentstring
    persistence-nvim
    plenary-nvim
    project-nvim
    render-markdown-nvim
    rustaceanvim
    snacks-nvim
    tabout-nvim
    tailwindcss-colors-nvim
    mason-lspconfig-nvim
    mason-nvim
    coc-tailwindcss
    # telescope-nvim
    todo-comments-nvim
    tokyonight-nvim
    ts-comments-nvim
    yanky-nvim
    # coc-eslint
  ];
  lazyPluginPath = "${pkgs.vimUtils.packDir lazyPkgs}/pack/all/start";
  treesitterParserPath = pkgs.symlinkJoin {
    name = "allGrammars";
    paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };
in
{
  home.packages = with pkgs; [
    svelte-language-server
    nodePackages."@prisma/language-server"
    nodePackages."wrangler"
    tailwindcss-language-server
    nodePackages."vscode-langservers-extracted"
    nil
    vtsls
  ];
  
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    # coc.enable = true;
    withNodeJs = true;
    # runtime.lua.source = ./nvim/lua/config/lazy.lua;

    extraConfig = ''
      set runtimePath=/etc/xdg/nvim/,$VIMRUNTIME,${pkgs.neovim-unwrapped}/lib/nvim
      set runtimePath^=${pkgs.vimPlugins.lazy-nvim}
      set runtimePath^=${treesitterParserPath}
      let g:lazyPluginPath = "${lazyPluginPath}"
    '';
  };
  #
  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

}
