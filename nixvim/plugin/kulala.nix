{
  plugins = {
    kulala = {
      enable = true;
      settings = {
        additional_curl_options = { };
        debug = false;
        default_env = "dev";
        default_view = "body";
        environment_scope = "b";
        icons = {
          inlay = {
            done = "✅";
            error = "❌";
            loading = "⏳";
          };
          lualine = "🐼";
        };
        contenttypes = {
          "application/json" = {
            formatter = [ "jq" "." ];
            ft = "json";
            pathresolver = {
              __raw = "require('kulala.parser.jsonpath').parse";
            };
          };
          "application/xml" = {
            formatter = [ "xmllint" "--format" "-" ];
            ft = "xml";
            pathresolver = [ "xmllint" "--xpath" "{{path}}" "-" ];
          };
          "text/html" = {
            formatter = [ "xmllint" "--format" "--html" "-" ];
            ft = "html";
            pathresolver = [ ];
          };
        };

      };

    };
  };
}
