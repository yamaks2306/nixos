# User packages - all user-specific packages should be managed here via Home Manager
# These are installed in the user's home directory and don't require system-wide installation
# Note: All user packages should be listed here, not in users.users.<name>.packages

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    home-manager
    # CLI utilities
    tree
    vim
    wget
    # Audio
    pavucontrol
    # Application launcher and utilities
    rofi
    rofi-calc
    rofi-power-menu
    # Browser
    vivaldi
    vivaldi-ffmpeg-codecs
    # Terminal
    kitty
    # Wayland applications (user-specific)
    waybar
    hyprpaper
    mako
    # Screenshots
    grimblast
    # Media control
    playerctl
    # Brightness control
    brightnessctl
    # System utilities (user-specific)
    xorg.xkill
    networkmanagerapplet
  ];
}

