{
  plugins.typescript-tools = {
    enable = false;
    settings = {
      settings = {
        tsserver_file_preferences = {
          __raw = ''
            function(ft)
              return {
                includeInlayParameterNameHints = "all",
                includeCompletionsForModuleExports = true,
                quotePreference = "auto",
              }
            end
          '';
        };
        tsserver_format_options = {
          __raw = ''
            function(ft)
              return {
                allowIncompleteCompletions = false,
                allowRenameOfImportPath = false,
              }
            end
          '';
        };
        tsserver_plugins = [ "@styled/typescript-styled-plugin" ];
      };
    };
  };
  # extraConfigLua = ''
  #   local api = require("typescript-tools.api")
  #   require("typescript-tools").setup {
  #     handlers = {
  #       ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
  #         -- Ignore 'This may be converted to an async function' diagnostics.
  #         { 80006 }
  #       ),
  #     },
  #   }
  # '';
}
