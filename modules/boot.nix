{ config, lib, pkgs, ... }:

{
  # Use systemd-boot boot loader
  boot.loader.systemd-boot.enable = true;

  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
      "nouveau.modeset=0"
    ];
  };
}

