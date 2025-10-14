{ pkgs, ... }: {
  home.packages = with pkgs; [
    trunk
    kotlin
    # nodePackages.typescript
    # vue-language-server
    # typescript-language-server
    # nodePackages.node-gyp
    jdk
    # jdk17
    flutter
    gradle
    maven
    liquibase
    ktor-cli
    dbus
    gobject-introspection
    sqlite
    # dbus-glib
    rustc
    cargo
    # rustup
    # stylua
    claude-code
    github-copilot-cli
    qwen-code
    gemini-cli
    opencode
    # libsoup_3

    # C++ toolchain
    nasm
    gcc
    # tree-sitter
    cmake
    pkg-config
    ninja
    clang-tools
    gnumake
    libgcc
    # opencv4

    # kulala-fmt
    # webkitgtk_4_0
    # gtk3
    # gtk4

    python311
    fzf
    skim
    websocat
    jq
    openssh
    openssl
    # pnpm
    nodejs
    # deno
    # yarn
    corepack

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

    nnn
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    tmux
    ripgrep
    fd
    bat
    pass
    zoxide
    devbox

    gh

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

}
