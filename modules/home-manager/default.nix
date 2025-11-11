{ pkgs, ... }:

let
  hyprland-bindings = import ./hyprland-bindings.nix;
in
{
  home.packages = with pkgs; [
    home-manager
    tree
    vim
    wget
    pavucontrol
    rofi
    rofi-calc
    rofi-power-menu
    vivaldi
    vivaldi-ffmpeg-codecs
    kitty
    waybar
    hyprpaper
    mako
    grimblast
    playerctl
    brightnessctl
    xorg.xkill
    networkmanagerapplet
  ];

  programs.git = { 
    enable = true;
    userName = "yamaks2306";
    userEmail = "maks@yastrebov.email";
    aliases = {
      st = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
	"/etc/nixos"
        "/home/maks/Project/Personal/Repositories/nixos"
      ];
    };
  };
  programs.bash.enable = true;
  programs.hyprlock.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [ ",preferred,auto,1" ];
      exec-once = [
        "waybar &"
        "mako &"
      ];
      bind = hyprland-bindings.bind;
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:ctrl_space_toggle";
        follow_mouse = 1;
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  home.stateVersion = "25.05";
}

