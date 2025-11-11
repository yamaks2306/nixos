{ config, lib, pkgs, ... }:

{
  users.users.maks = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
    ];
    home = "/home/maks";
  };
}

