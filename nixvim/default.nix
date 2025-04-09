{ ... }: {
  # Import all your configuration modules here
  programs.nixvim = {
    imports = [
      ./cmp
      ./lsp
      ./plugin-manager/lazy.nix
      ./ui
      ./plugin
      ./normal-config
      ./utils
      ./debugs
    ];
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    extraConfigLua = ''
      -- Configure virtual text (inline diagnostics)
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",       -- Bullet character
          spacing = 4,        -- Space after diagnostic
          format = function(d)
            return d.message:gsub("\n", " "):gsub("\t", " ")
          end
        },
        signs = true,         -- Show gutter signs
        underline = true,     -- Underline errors
        update_in_insert = false, -- Don't update while typing
        severity_sort = true, -- Sort by error severity
        float = {             -- Diagnostic hover window
          border = "rounded",
          source = "always",
        }
      })

      -- Show diagnostics on cursor hold
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "CursorMoved", "BufHidden" }
          })
        end
      })
    '';
  };
}
