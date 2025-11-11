{ pkgs, ... }:

let
  hyprland-bindings = import ./hyprland-bindings.nix;
  user-packages = import ./packages.nix { inherit pkgs; };
in
user-packages // {
  programs.git.enable = true;
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
    # Enable XWayland for X11 application compatibility
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
        kb_options = "grp:win_space_toggle";
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

