{ config, lib, pkgs, ... }:

{
  # System packages - packages that need system-wide installation
  # or are required for system services
  # Note: User applications should be in modules/home-manager/packages.nix
  environment.systemPackages = with pkgs; [
    # Encryption (system-wide for system services)
    gnupg
    pinentry
    # Wayland compositor (required system-wide)
    hyprland
    xorg.xkeyboardconfig
    # System utilities and libraries
    polkit_gnome
    psmisc
    xwayland
    mesa
    # GTK libraries (required for Flatpak and system-wide apps)
    gtk3
    # Power management daemon
    power-profiles-daemon
    # Display manager component
    greetd.gtkgreet
  ];
}

