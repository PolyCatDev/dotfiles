{ config, pkgs, ... }:

{
  # Enable GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude unnecessary GNOME applications
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    cheese
    gnome-music
    gedit
    epiphany
    geary
    evince
    gnome-characters
    totem
    tali
    iagno
    hitori
    atomix
    gnome-connections
    gnome-maps
    file-roller
    gnome-software
    simple-scan
    gnome-system-monitor
    xterm
  ]);

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    celluloid
    mission-center
    papers
    protonplus
    gnomeExtensions.appindicator
    gnomeExtensions.custom-accent-colors
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-assistant
    gnomeExtensions.caffeine
    gnomeExtensions.gsconnect
    gnomeExtensions.quick-settings-tweaker
  ];


  # Enable GNOME extensions
  programs.dconf.enable = true;
}

