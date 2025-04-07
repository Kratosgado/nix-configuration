{ pkgs, lib, ... }:
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

  # Modified keymaps to work with tabout
  keymaps = [
    {
      mode = "i";
      key = "<Tab>";
      lua = true;
      action =
        #lua
        ''
          function()
            if require("tabout").tabout() then
              return
            elseif require("cmp").visible() then
              require("cmp").select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
            end
          end
        '';
    }
    {
      mode = "i";
      key = "<S-Tab>";
      lua = true;
      action =
        #lua
        ''
          function()
            if require("tabout").tabout_back() then
              return
            elseif require("cmp").visible() then
              require("cmp").select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n")
            end
          end
        '';
    }
  ];
}
