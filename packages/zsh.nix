{ pkgs, ... }: {

  home.packages = with pkgs; [ pay-respects ];
  programs = {
    # starship - an customizable prompt for any shell
    starship = {
      enable = true;
      # custom settings
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      dotDir = "/home/kratosgado/.config/zsh";

      shellAliases = {
        hms = "home-manager switch";
        lg = "lazygit";
        v = "nvim";
        c = "clear";
        cat = "bat --theme='Catppuccin Mocha'";
        cd = "z";
        fk = "pay-respects";
        pn = "pnpm";
        px = "pnpx";
        ls =
          "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        #   cd = "z";
        s = "web_search duckduckgo";

        l = "ls -alh";
        ll = "ls -l";
        # git aliases
        gc = "git add . && git commit -m";
        gs = "git status";
        go = "git checkout";
        gb = "git branch";
        push = "git push";
        upgrade =
          "sudo nix flake update --flake ~/projects/configs/nixos && update";
        update = "sudo nixos-rebuild switch --flake ~/projects/configs/nixos";
        syncconfig =
          "sudo rsync -avh --delete --exclude .git ~/projects/configs/nixos/ /etc/nixos/";
        switch =
          "syncconfig && sudo nixos-rebuild switch && sudo cp /etc/nixos/flake.lock ~/projects/configs/nixos/flake.lock";
        iswitch =
          "syncconfig  && sudo nixos-rebuild switch --impure && sudo cp /etc/nixos/flake.lock ~/projects/configs/nixos/flake.lock";
        editconfig =
          "cd ~/projects/configs/nixos/ && nvim ~/projects/configs/nixos/";

        # Rust aliases
        cr = "cargo run";
        cb = "cargo build";
        ct = "cargo test";
        # cc = "cargo check";
        ccp = "cargo clippy";
        cf = "cargo fmt";
      };
      oh-my-zsh = {
        enable = true;
        extraConfig = builtins.readFile ./extraConfig.zsh;
        # Additional oh-my-zsh plugins
        plugins = [ "web-search" "copyfile" "copybuffer" "fzf" "pay-respects" ];
      };

      plugins = [
        # Autocompletions
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.1";
            hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
          };
        }
        # Completion scroll
        {
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.35.0";
            hash = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
          };
        }
        # Highlight commands in terminal
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.8.0";
            hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
          };
        }
      ];
      initContent = ''
        ;
                [[ ! -f ~/.config/home-manager/.p10k.zsh ]] || source ~/.config/home-manager/.p10k.zsh
      '';
    };

    # Atuin
    atuin = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        dialect = "us";
        style = "compact";
        inline_height = 15;
      };
    };
  };
}
