{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles = {
      typescript = {
        extensions = with pkgs.vscode-extensions; [
          ms-vscode-remote.remote-ssh
          alefragnani.bookmarks
          ms-azuretools.vscode-docker
          adpyke.codesnap
          dbaeumer.vscode-eslint
          usernamehw.errorlens
        ];
      };
      vue = {
        extensions = with pkgs.vscode-extensions; [
          alefragnani.bookmarks
          vue.volar
          usernamehw.errorlens
          dbaeumer.vscode-eslint
          adpyke.codesnap
          # vue.vscode-typescript-vue-plugin
          # vue
          # (pkgs.vscode-with-extensions.override {
          #   vscodeExtensions = with pkgs.vscode-extensions;
          #     [ adpyke.codesnap ]
          #     ++ pkgs.vscode-utils.extensionFromVscodeMarketplace [{
          #       name = "Kratosgado.italic-dark-theme";
          #       publisher = "Kratosgado";
          #       version = "0.0.2";
          #       sha256 = "87105593033575af55810ed42c1eef1bc05d1037";
          #     }];
          # })
        ];
      };
      rust = {
        extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
          usernamehw.errorlens
          dbaeumer.vscode-eslint
          adpyke.codesnap
          alefragnani.bookmarks
        ];
      };
    };
  };
}
