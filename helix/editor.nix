{
  programs.helix.settings.editor = {
    cursorline = true;
    completion-replace = true;
    true-color = true;
    bufferline = "always";
    color-modes = true;
    popup-border = "all";
    auto-save.focus-lost = true;
    indent-guides.render = true;
    end-of-line-diagnostics = "hint";
    inline-diagnostics.cursor-line = "warning";
    cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
    lsp = {
      display-inlay-hints = true;
      display-progress-messages = true;
      display-messages = true;
    };
    file-picker = {
      hidden = false;
    };
    statusline = {
      left = [ "mode" "spinner" "file-name" ];
      center = [ ];
      right = [
        "diagnostics"
        "selections"
        "position"
        "position-percentage"
        "file-encoding"
        "file-line-ending"
        "file-type"
      ];
      separator = "│";
      mode.normal = "NORMAL";
      mode.insert = "INSERT";
      mode.select = "SELECT";
    };
  };
}
