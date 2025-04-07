{

  programs.helix.settings.keys = {
    insert = {
      j = { k = "normal_mode"; };
      "C-space" = "completion";
    };
    select = { g = { c = "toggle_comments"; }; };
    normal = {
      H = "goto_previous_buffer";
      L = "goto_next_buffer";
      K = "hover";
      g = { c = "toggle_comments"; };
      "=" = ":format";
      space = {
        space = "file_picker";
        q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
        b = {
          d = ":bc!";
          o = ":bco!";
          b = "buffer_picker";
        };
      };
    };
  };
}
