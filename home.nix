{ pkgs, ... }: {
  imports = [ ./lazyvim ];
  home = {
    username = "kratosgado";
    homeDirectory = "/home/kratosgado";

    stateVersion = "24.11";
    packages = with pkgs; [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      gnomeExtensions.dash-to-dock
      gnomeExtensions.hide-top-bar
      gnome-tweaks
      gnomeExtensions.gsconnect
      gnomeExtensions.user-themes
      andromeda-gtk-theme
      dbus
      glib
      gobject-introspection
      sqlite
      dbus-glib
      gtk4
      pcsx2
      firefox
      trunk
      openssl
      libsoup
      webkitgtk_4_0
      gtk3
      obs-studio
      #flutter
      #jdk17
      postman
      xclip
      ngrok
      gimp
      # blender
      vscode
      android-studio
      # #google-chrome
      # #vlc
      libreoffice
      docker
      python311
      fzf
      curl
      jq
      gcc
      openssh
      openssl
      pnpm
      nodejs
      deno
      unzip
      yarn
      corepack
      dbeaver-bin
      mongodb-compass
      telegram-desktop

      neofetch

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      nnn
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder
      lazygit
      tmux
      ripgrep
      fd
      bat
      pass
      zoxide
      devbox
      jetbrains-mono
      gh
      thefuck

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc # it is a calculator for the IPv4/v6 addresses
      gnupg
      glow # markdown previewer in terminal
      ethtool
        pciutils # lspci
      usbutils # lsusb
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISIUAL = "nvim";
      FZF_CTRL_T_OPTS =
        "--preview 'bat -n --color=always --theme='Catppuccin Mocha' --line-range :500 {}'";
      FZF_ALT_C_OPTS = "--preview 'eza --tree --color=always {} | head -200'";
    };
  }; # Please read the comment before changing.
  fonts.fontconfig.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
  # Let Home Manager install and manage itself.
  programs = {

    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Kratosgado";
      userEmail = "mbeahessilfieprince@gmail.com";
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };
      extraConfig = {
        push = { autoSetupRemote = true; };

        credential.helper = "${
            pkgs.git.override { withLibsecret = true; }
          }/bin/git-credential-libsecret";
      };
    };

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
    # dconf.settings = {
    #   "org/gnome/desktop/interface" = {
    #     font-name = "JetBrainsMono Nerd Font 12";
    #     document-font-name = "JetBrainsMono Nerd Font 12";
    #     monospace-font-name = "JetBrainsMono Nerd Font Mono 12";
    #   };
    #   "org/gnome/terminal/legacy/profiles:/:<profile-id>" = {
    #     font = "JetBrainsMono Nerd Font Mono 12";
    #     use-system-font = false;
    #   };
    # };

    tmux.plugins.tmux.plugins = [ pkgs.tmuxPlugins.vim-tmux-navigator ];
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      dotDir = ".config/zsh";

      shellAliases = {
        hms = "home-manager switch";
        lg = "lazygit";
        v = "nvim";
        c = "clear";
        cat = "bat --theme='Catppuccin Mocha'";
        cd = "z";
        fk = "fuck";
        pn = "pnpm";
        ls =
          "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";
        #   cd = "z";
        s = "web_search duckduckgo";

        l = "ls -alh";
        ll = "ls -l";
        commit = "git add . && commit -m";
        push = "git push";
        switch =
          "sudo cp -r ~/projects/configs/nix-configuration/* /etc/nixos/.  && sudo nixos-rebuild switch && sudo cp /etc/nixos/flake.lock ~/projects/configs/nix-configuration/flake.lock";
        iswitch =
          "sudo cp -r ~/projects/configs/nix-configuration/* /etc/nixos/.  && sudo nixos-rebuild switch --impure && sudo cp /etc/nixos/flake.lock ~/projects/configs/nix-configuration/flake.lock";
        editconfig =
          "cd ~/projects/configs/nix-configuration/ && nvim ~/projects/configs/nix-configuration/";

          # Rust aliases
  cr = "cargo run";
  cb = "cargo build";
  ct = "cargo test";
  cc = "cargo check";
  ccp = "cargo clippy";
  cf = "cargo fmt";
      };
      oh-my-zsh = {
        enable = true;
        extraConfig = builtins.readFile ./extraConfig.zsh;
        # Additional oh-my-zsh plugins
        plugins = [ "web-search" "copyfile" "copybuffer" "fzf" "thefuck" ];
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
      initExtra = ''
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
