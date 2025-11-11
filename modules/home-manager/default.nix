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
    hyprpaper
    mako
    grimblast
    playerctl
    brightnessctl
    xorg.xkill
    networkmanagerapplet
    telegram-desktop
    bitwarden
    twingate
    gnomeExtensions.twingate-status
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 2;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ ];
        modules-right = [ "hyprland/language" "pulseaudio" "tray" "clock" ];
        "hyprland/workspaces" = {
          all-outputs = true;
          disable-scroll = true;
          format = "{id}";
        };
        "hyprland/language" = {
          format = "{short}";
          tooltip = false;
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
        };
        pulseaudio = {
          format = "{volume}%";
          format-muted = "Muted";
        };
        tray = {
          spacing = 8;
          icon-size = 18;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono", monospace;
        font-size: 12px;
        min-height: 0;
      }
      
      window#waybar {
        background-color: #1e1e1e;
        color: #d4d4d4;
        border-bottom: 1px solid #2d2d2d;
      }
      
      #workspaces {
        background-color: transparent;
        padding: 0 4px;
      }
      
      #workspaces button {
        padding: 0 8px;
        margin: 0 2px;
        background-color: transparent;
        color: #808080;
        border-bottom: 2px solid transparent;
      }
      
      #workspaces button:hover {
        background-color: #2d2d2d;
        color: #d4d4d4;
      }
      
      #workspaces button.active {
        color: #d4d4d4;
        border-bottom: 2px solid #808080;
      }
      
      #hyprland-language,
      #clock,
      #tray,
      #pulseaudio {
        background-color: transparent;
        color: #d4d4d4;
        padding: 0 8px;
        margin: 0 2px;
      }
      
      #tray {
        padding: 0;
        margin: 0 2px;
      }
      #tray > * {
        margin: 0 6px;
      }
      #tray > *:first-child {
        margin-left: 0;
      }
      #tray > *:last-child {
        margin-right: 0;
      }

      #pulseaudio.muted {
        color: #808080;
      }
    '';
  };

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
	"nm-applet &"
	"twingate-notifier &"
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

  services.gnome-keyring.enable = true;

  home.stateVersion = "25.05";
}

