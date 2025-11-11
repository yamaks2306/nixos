# Hyprland keybindings configuration
# This file contains all keyboard shortcuts and bindings for Hyprland

{
  bind = [
    # Application launcher
    "SUPER, D, exec, rofi -show drun"
    "SUPER, Return, exec, kitty"

    # Window management
    "SUPER, Q, killactive,"
    "SUPER, M, exit,"
    "SUPER, F, fullscreen,"
    "SUPER, V, togglefloating,"
    "SUPER, C, centerwindow,"
    "SUPER, P, pseudo,"
    "SUPER, J, togglesplit,"
    "SUPER, S, togglespecialworkspace,"

    # Focus navigation
    "SUPER, left, movefocus, l"
    "SUPER, right, movefocus, r"
    "SUPER, up, movefocus, u"
    "SUPER, down, movefocus, d"
    "SUPER, Tab, cyclenext,"
    "SUPER, Tab, bringactivetotop,"

    # Move windows
    "SUPER SHIFT, left, movewindow, l"
    "SUPER SHIFT, right, movewindow, r"
    "SUPER SHIFT, up, movewindow, u"
    "SUPER SHIFT, down, movewindow, d"

    # Resize windows
    "SUPER CTRL, left, resizeactive, -50 0"
    "SUPER CTRL, right, resizeactive, 50 0"
    "SUPER CTRL, up, resizeactive, 0 -50"
    "SUPER CTRL, down, resizeactive, 0 50"

    # Workspaces - switch
    "SUPER, 1, workspace, 1"
    "SUPER, 2, workspace, 2"
    "SUPER, 3, workspace, 3"
    "SUPER, 4, workspace, 4"
    "SUPER, 5, workspace, 5"
    "SUPER, 6, workspace, 6"
    "SUPER, 7, workspace, 7"
    "SUPER, 8, workspace, 8"
    "SUPER, 9, workspace, 9"
    "SUPER, 0, workspace, 10"
    "ALT, RIGHT, workspace, r+1"
    "ALT, LEFT, workspace, r-1"
    "SUPER, mouse_down, workspace, e+1"
    "SUPER, mouse_up, workspace, e-1"

    # Workspaces - move window
    "SUPER SHIFT, 1, movetoworkspace, 1"
    "SUPER SHIFT, 2, movetoworkspace, 2"
    "SUPER SHIFT, 3, movetoworkspace, 3"
    "SUPER SHIFT, 4, movetoworkspace, 4"
    "SUPER SHIFT, 5, movetoworkspace, 5"
    "SUPER SHIFT, 6, movetoworkspace, 6"
    "SUPER SHIFT, 7, movetoworkspace, 7"
    "SUPER SHIFT, 8, movetoworkspace, 8"
    "SUPER SHIFT, 9, movetoworkspace, 9"
    "SUPER SHIFT, 0, movetoworkspace, 10"
    "ALT SHIFT, RIGHT, movetoworkspace, r+1"
    "ALT SHIFT, LEFT, movetoworkspace, r-1"

    # System
    "SUPER, L, exec, hyprlock"
    "SUPER SHIFT, E, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"

    # Screenshots
    ", Print, exec, grimblast copy area"
    "SHIFT, Print, exec, grimblast copy screen"
    "CTRL, Print, exec, grimblast save area"
    "CTRL SHIFT, Print, exec, grimblast save screen"

    # Audio control
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

    # Media control
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPause, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"

    # Brightness control
    ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
    ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
  ];
}

