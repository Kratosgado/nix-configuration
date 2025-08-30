{ pkgs, ... }:
let
  tabout-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "tabout.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "abecodes";
      repo = "tabout.nvim";
      rev = "9a3499480a8e53dcaa665e2836f287e3b7764009"; # Check latest commit
      hash =
        "sha256-5T/nefCPCR2K1vySTG0vzh5+6weHinBLahPBL37+VtY="; # Get via error
    };
  };
in {
  # Add tabout as an extra plugin
  extraPlugins = [ tabout-nvim ];
  # Configure tabout via Lua
  extraConfigLua = ''
    require('tabout').setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = false,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" },
        },
        ignore_beginning = true,
        exclude = {},
    })
  '';
}
