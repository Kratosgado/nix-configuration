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

  extraPlugins = with pkgs.vimPlugins; [
    neoformat
    vim-test
    vimux
    vim-quickrun
    vim-be-good
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
