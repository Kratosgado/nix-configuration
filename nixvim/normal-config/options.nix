{ pkgs, ... }: {

  # colorschemes..................................................................
  wrapRc = true;
  enableMan = true;
  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
    # transparentBackground = true;
  };

  #...............................................................................

  # options to configure for neovim
  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };
  opts = {
    number = true; # Show line numbers
    relativenumber = true; # Show relative line numbers
    autoindent = true;
    smartindent = true;
    backspace = "indent,eol,start";
    # backup = true;
    cmdheight = 1;
    # colorcolumn = "80";
    # completeopt = "menu,menuone,noselect";
    # conceallevel = 0;
    cursorline = true;
    # expandtab = true;
    updatetime = 100;
    # foldenable = true;
    splitbelow = true;
    splitright = true;
    # foldexpr = "nvim_treesitter#foldexpr()";
    # foldlevel = 5;
    # foldmethod = "expr";
    ignorecase = true;
    # laststatus = 3;
    mouse = "a";
    # pumheight = 0;
    shiftwidth = 2;
    showtabline = 1;
    # signcolumn = "yes";
    smartcase = true;
    tabstop = 2;
    termguicolors = true;
    timeoutlen = 300;
    undofile = true;
    swapfile = false;
    guifont = "JetBrainsMono Nerd Font";
    grepformat = "%f:%l:%c:%m";
    # updatetime = 300;
    # wrap = false;
    # writebackup = true;
    # clipboard = "unnamedplus";
    scrolloff = 999;
    virtualedit = "block";
    inccommand = "split";
  };
  diagnostics = {
    virtual_text = {
      prefix = "●"; # Bullet character
      spacing = 4; # Space after diagnostic
      # format = function(d)
      # 	return d.message:gsub("\n", " "):gsub("\t", " ")
      # end;
    };
    signs = true; # -- Show gutter signs
    underline = true; # -- Underline errors
    update_in_insert = false; # -- Don't update while typing
    severity_sort = true; # -- Sort by error severity
    float = { # -- Diagnostic hover window
      border = "rounded";
      source = "always";
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "snacks.nvim";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "folke";
    #     repo = "snacks.nvim";
    #     rev = "v2.22.0"; # Replace with latest commit
    #     hash =
    #       "sha256-0a5nw7xa33shag1h12gf930g3vcixbwk8dxv0ji4980ycskh238v"; # Get via nix-prefetch-url
    #   };
    # })
    # snacks-nvim
    neoformat
    vim-test
    vimux
    skim
    vim-quickrun
    neorg
    neorg-telescope
  ];
  extraConfigLua = builtins.readFile ./config.lua;
  autoCmd = [{
    event = [ "TermOpen" ];
    pattern = [ "*" ];
    command = "startinsert";
  }];
  # };
}
