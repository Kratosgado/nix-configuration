{
  plugins.typescript-tools = {
    enable = false;
    settings = {
      handlers = {
        "textDocument/publishDiagnostics" = ''
          api.filter_diagnostics(
            { 80006 }
          )
        '';
      };
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
}
