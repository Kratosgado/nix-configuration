{
 programs.nvf.settings.vim = {
    binds = {
      whichKey = {
        enable = true;
        register = {"<leader>l" = "Line actions";}; 
      };
    };
  keymaps = [{
          key = ";;";
          mode = [ "i" "n" "t" "x" "v" ];
          silent = true;
          noremap = true;
          action = "<Esc>";
    }
    ];
  };
}
