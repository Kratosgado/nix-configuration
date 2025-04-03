{
  
programs.helix.settings.keys = {
        insert = { j = { k = "normal_mode"; }; };
        select = { g = { c = "toggle_comments"; }; };
        normal = {
          H = "goto_previous_buffer";
          L = "goto_next_buffer";
          K = "hover";
          g = { c = "toggle_comments"; };
          space = {
            b = {
              d = ":bc!";
              o = ":bco!";
              b = "buffer_picker";
            };
          };
        };
      };}
