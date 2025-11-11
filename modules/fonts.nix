{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.inconsolata-lgc
      noto-fonts
      noto-fonts-emoji
      dejavu_fonts
      liberation_ttf
      unifont
    ];
  };
}

