{ config, lib, pkgs, ... }:

{
  # X server is required for NVIDIA drivers initialization in NixOS
  # even when using Wayland (Hyprland). This is a NixOS-specific requirement.
  # The X server is not actually used as display server - Wayland is.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  # Disable X11 desktop manager - we use Wayland (Hyprland)
  services.xserver.desktopManager.session = [];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS' --time --asterisks --remember-session";
        user = "maks";
      };
    };
  };
}

