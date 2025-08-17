{ pkgs, lib, ... }:
let clibraries = with pkgs; [ xorg.libX11 stdenv.cc.cc.lib zlib ];
in {
  imports = [ ./vscode ];
  dconf.settings = {
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };

    #   "org/gnome/desktop/interface" = {
    #     font-name = "JetBrainsMono Nerd Font 12";
    # document-font-name = "JetBrainsMono Nerd Font 12";
    #     monospace-font-name = "JetBrainsMono Nerd Font Mono 12";
    #   };
    #   "org/gnome/terminal/legacy/profiles:/:<profile-id>" = {
    #     font = "JetBrainsMono Nerd Font Mono 12";
    #     use-system-font = false;
    #   };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/kratosgado/Pictures/wallpaper.jpg";
      picture-uri-dark = "file:///home/kratosgado/Pictures/wallpaper.jpg";
    };
  };
  home = {
    username = "kratosgado";
    homeDirectory = "/home/kratosgado";

    stateVersion = "24.11";
    packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.hide-top-bar
      gnome-tweaks
      gnomeExtensions.gsconnect
      gnomeExtensions.clipboard-history
      gnomeExtensions.user-themes
      andromeda-gtk-theme
      dbus
      glib
      gobject-introspection
      sqlite
      dbus-glib
      firefox
      tor-browser
      awscli2
      aws-nuke
      trunk
      kotlin
      poetry
      nodePackages.typescript
      nodePackages."@vue/language-server"
      nodePackages."typescript-language-server"
      nodePackages.node-gyp
      jdk
      # jdk17
      flutter
      gradle
      maven
      liquibase
      ktor-cli

      rustc
      cargo
      stylua
      libsoup_2_4

      # C++ toolchain
      nasm
      gcc
      cmake
      pkg-config
      ninja
      clang-tools
      gnumake
      libgcc
      opencv4

      webkitgtk_4_0
      gtk3
      gtk4
      obs-studio
      insomnia
      xclip
      ngrok
      gimp
      blender
      blendfarm
      # vscode
      code-cursor
      # android-studio-full
      android-studio
      jetbrains.idea-community
      google-chrome
      vlc
      slack
      vdhcoapp
      yt-dlp
      libreoffice
      docker
      python311
      fzf
      skim
      curlHTTP3
      jq
      openssh
      openssl
      pnpm
      nodejs
      deno
      yarn
      corepack
      dbeaver-bin
      mongodb-compass
      telegram-desktop
      zapzap

      neofetch

      # for viewing binary files
      hex
      hexedit
      hextazy

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      jdt-language-server
      prisma-engines
      prisma
      lombok
      redisinsight
      postgresql # for dadbod
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

    file = {
      "Pictures/wallpaper.jpg" = { source = ./files/wallpaper.jpg; };
      "Pictures/kratosgado.png" = { source = ./files/kratosgado.png; };
      ".npmrc".text = "prefix=$HOME/.npm-packages";
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
      LD_LIBRARY_PATH = "${lib.makeLibraryPath clibraries}";
      LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
      PKG_CONFIG_PATH =
        "${pkgs.opencv4}/lib/pkgconfig:${pkgs.openssl.dev}/lib/pkgconfig:${pkgs.libxml2.dev}/lib/pkgconfig";
      NPM_CONFIG_PREFIX = "$HOME/.npm-packages";
      PATH = "/home/kratosgado/.npm-packages/bin:$PATH";
      NODE_PATH = "$HOME/.npm-packages/lib/node_modules";
      JAVA_HOME = "${pkgs.jdk}";
      GRADLE_USER_HOME = "$HOME/.gradle";
      CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome-stable";
      # This forces kotlin-language-server to use the correct JDK
      KOTLIN_LANGUAGE_SERVER_JAVA_HOME = "${pkgs.jdk}";

      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_QUERY_ENGINE_LIBRARY =
        "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_INTROSPECTION_ENGINE_BINARY =
        "${pkgs.prisma-engines}/bin/introspection-engine";
      PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
    };
  };
  fonts.fontconfig.enable = true;

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
    network-manager-applet.enable = true;
  };
  # nixpkgs.config = {
  #   allowBroken = true;
  #   allowUnfree = true;
  #   allowUnfreePredicate = true;
  # };
  # Let Home Manager install and manage itself.
  programs = {

    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Kratosgado";
      userEmail = "mbeahessilfieprince@gmail.com";
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
        upgrade = "sudo nixos-rebuild switch --upgrade";
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
