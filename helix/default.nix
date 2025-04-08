{ pkgs, inputs, ... }: {
  imports = [ ./editor.nix ./keymaps.nix ./extra-packages.nix ./languages.nix ];
  home.packages = with pkgs; [
    kotlin
    poetry
    nodePackages.typescript
    nodePackages."@vue/language-server"
    nodePackages."typescript-language-server"
    jdk
    gradle
    maven
    rustc
    cargo
    pkg-config
    vimPlugins.none-ls-nvim # vimPlugins.nvim-lspconfig
    stylua
  ];

  programs.helix = {
    enable = true;
    defaultEditor = false;
    package = inputs.helix.packages.${pkgs.system}.default;
    settings = { theme = "tokyonight"; };
    ignores = [ ".build/" ".dist/" "!.gitignore" ];

    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };

  };

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk}";
    # This forces kotlin-language-server to use the correct JDK
    KOTLIN_LANGUAGE_SERVER_JAVA_HOME = "${pkgs.jdk}";
  };
}
