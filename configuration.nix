# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # inputs.home-manager.nixosModules.default
      # <home-manager/nixos>
    ];
    

  # # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.kratos.isNormalUser = true;
  # home-manager.users.kratos = {pkgs, ...}: {
  #   home = "/home/kratosgado/";
  #   # home.packages = [pkgs.atool pkgs.httpie ];
  #   programs.bash.enable = true;
  #
  #   home.stateVersion = "24.11";
  # };
   #
   # home-manager.useUserPackages = true;
   # home-manager.useGlobalPkgs = true;
   #
   users.users.kratosgado = {
     isNormalUser = true;
     description = "Kratosgado";
     extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "adbusers"];
     packages = with pkgs; [
      vim
     ];
   };
   #
   # home-manager = {
   #   extraSpecialArgs = {inherit inputs; };
   #   users = {
   #      "kratosgado" = import ./home.nix;
   #   };
   # };
   #  programs.adb.enable = true;
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

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

environment.variables = {
    GTK_THEME = "Andromeda";
    GDM_THEME = "Andromeda";
    # switch = "sudo nixos-rebuild switch";
    # editconf = "sudo nvim /etc/nixos/configuration.nix";
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.gnome.excludePackages = with pkgs; [
  baobab  # disk usage analyzer
  epiphany  # web browser
  simple-scan  # document scanner
  totem  # video player
  yelp  # help viewer
  evince  # document viewer
  geary  # email client
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
  # virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
#   programs.git = {
#   enable = true;
#   package = pkgs.gitFull;
#   config = {
#     credential.helper = "libsecret";
#   };
# };
  fonts.packages = with pkgs; [fira-code-nerdfont];
  programs.bash.completion.enable = true;
  programs.bash.shellAliases = {
  l = "ls -alh";
  ll = "ls -l";
  ls = "ls --color=tty";
  switch = "sudo nixos-rebuild switch";
    defaultRebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#default";
  editconfig = "export EDITOR=nvim && sudoedit /etc/nixos/configuration.nix";
};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
