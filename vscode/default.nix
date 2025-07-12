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
          # (vscode-with-extensions.override {
          #   extensions = [ "publisher.extension-name" ];
          # })
          # (pkgs.vscode-with-extensions.override {
          #   vscodeExtensions = with pkgs.vscode-extensions;
          #     [
          #       bbenoist.nix
          #       ms-python.python
          #       ms-azuretools.vscode-docker
          #       ms-vscode-remote.remote-ssh
          #     ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          #       {
          #         name = "italic-dark-theme";
          #         publisher = "Kratosgado";
          #         version = "0.0.2";
          #         # rev = "87105593033575af55810ed42c1eef1bc05d1037";
          #         sha256 = "QUlX7Psg+090w9nvpwaRrcWlYrZ6KlgOvzCrYl1nFc8=";
          #       }
          #       {
          #         name = "remote-ssh-edit";
          #         publisher = "ms-vscode-remote";
          #         version = "0.47.2";
          #         sha256 =
          #           "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          #       }
          #     ];
          # })
        ];
        userSettings = builtins.fromJSON (builtins.readFile ./typescript.json);
      };
      vue = {
        extensions = with pkgs.vscode-extensions; [
          alefragnani.bookmarks
          vue.volar
          usernamehw.errorlens
          dbaeumer.vscode-eslint
          adpyke.codesnap
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
