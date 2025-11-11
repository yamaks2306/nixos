{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  # Configure portal backend for xdg-desktop-portal >= 1.17
  # Use Hyprland portal for all interfaces
  xdg.portal.config.common.default = "*";
}

