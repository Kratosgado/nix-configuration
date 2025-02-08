{ pkgs, ... }:
let

  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.fish
    p.gitattributes
    p.gitignore
    p.javascript
    p.jq
    p.json5
    p.json
    p.lua
    p.make
    p.markdown
    p.nix
    p.python
    p.rust
    p.toml
    p.typescript
    p.yaml
  ]));

in {

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    coc.enable = false;
    withNodeJs = true;

    plugins = [ pkgs.vimPlugins.lazy-nvim treesitterWithGrammars ];
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

}
