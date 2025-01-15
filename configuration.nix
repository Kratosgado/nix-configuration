{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


   users.users.kratosgado = {
     isNormalUser = true;
     description = "Kratosgado";
     shell= pkgs.zsh;
     extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "adbusers"];
     packages = with pkgs; [

     ];
   };

    # programs.adb.enable = true;
   #

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Accra";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ak_GH";
    LC_IDENTIFICATION = "ak_GH";
    LC_MEASUREMENT = "ak_GH";
    LC_MONETARY = "ak_GH";
    LC_NAME = "ak_GH";
    LC_NUMERIC = "ak_GH";
    LC_PAPER = "ak_GH";
    LC_TELEPHONE = "ak_GH";
    LC_TIME = "ak_GH";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  hardware.bluetooth.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

environment.variables = {
    GTK_THEME = "Andromeda";
    GDM_THEME = "Andromeda";
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.gnome.excludePackages = with pkgs; [
  baobab  # disk usage analyzer
  epiphany  # web browser
  simple-scan  # document scanner
  totem  # video player
  yelp  # help viewer
  evince  # document viewer
  # geary  # email client
  gnome-calculator
  # gnome-contacts
  gnome-maps
  gnome-music
  # gnome-screenshot
  gnome-system-monitor
  # gnome-connections
  # gnome-console
];
   environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.user-themes
    andromeda-gtk-theme
    fzf
    curl
    jq
    direnv
    nix-direnv
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
    # enable docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  fonts.packages = with pkgs; [fira-code-nerdfont];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.11"; # Did you read the comment?

}
