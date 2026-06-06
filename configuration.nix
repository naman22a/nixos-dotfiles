{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Automatic updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.dbus.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false; # Disable legacy pulseaudio

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  users.users."naman" = {
    isNormalUser = true;
    description = "Naman Arora";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    fastfetch
    htop
    foot
    kitty
    waybar
    git
    hyprpaper
    git
    swaybg
    keepassxc
    neovim
    hyprpolkitagent
    tofi
    pamixer
    brightnessctl
    cloudflared
    nwg-look
    hyprpicker
    hyprlock
    gcc
    unzip
    swayimg
    nautilus
    gruvbox-gtk-theme
    papirus-icon-theme
    tmux
    vscode
    nodejs_24
    bun
    yarn
    postman
    grim
    virtualenv
    vlc
    cmatrix
    rustc
    cargo
    rustfmt
    clippy
    pkg-config
    openssl
    xdg-user-dirs
    quickshell
    psmisc
    wl-clipboard
    tree
    cava
    bat
  ];

  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  virtualisation.docker.enable = true;
  services.getty.autologinUser = "naman";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "26.05";

}
