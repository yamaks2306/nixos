{ config, lib, pkgs, ... }:

{
  services.dbus.enable = true;
  services.openssh.enable = true;

  services.kmscon = {
    enable = true;
    fonts = [
      { name = "Noto Sans Mono"; package = pkgs.noto-fonts; }
    ];
    hwRender = true;
  };

  # Udev rule for Vial keyboard (Ergohaven Velvet V3)
  # Fix: SUBSYSTEM should be "hidraw" not "hydraw"
  # Using "input" group since user is already in it
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="input", TAG+="uaccess", TAG+="udev-acl"
  '';
}

