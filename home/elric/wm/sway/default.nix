{
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ../../pkgs/rofi
    ../../pkgs/eww
    ../../pkgs/kitty
  ];

  home.packages = with pkgs; [
    swayfx
    rofi-wayland

    spotify
    discord
    kitty
    qutebrowser
    brave

    wf-recorder
    wl-clipboard
    grim
    slurp
    wlprop

    eww
    brightnessctl
    playerctl
    pamixer
    libnotify
    mako

    # Json parser for switch workspace script
    jq
  ];

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    package = pkgs.swayfx;
    config = {
      defaultWorkspace = "workspace number 1";
      modifier = "Mod4";
      terminal = "kitty";
      output = {
        "*" = {
          # background = "~/.local/share/wallpapers/MOSHED-2025-10-19-1-20-23.jpg fill";
          background = "~/Downloads/97582.jpg fill";
        };
      };
      bars = [];
      gaps = {
        inner = 5;
        outer = 5;
      };
      colors = {
        focused = {
          border = "#101010";
          background = "#101010";
          childBorder = "#101010";
          indicator = "#101010";
          text = "#101010";
        };
        focusedInactive = {
          border = "#151515";
          background = "#151515";
          childBorder = "#151515";
          indicator = "#151515";
          text = "#151515";
        };
        unfocused = {
          border = "#151515";
          background = "#151515";
          childBorder = "#151515";
          indicator = "#151515";
          text = "#151515";
        };
      };
      window = {
        titlebar = false;
      };
      input = {
        "*" = {
          xkb_layout = "se";
        };
      };
      startup = [
        { command = "eww daemon"; }
        { command = "eww --force-wayland open bar"; }
        { command = "mako"; }
      ];
      modes.resize = {
        Escape = "mode default";
        Return = "mode default";
        h = "resize shrink width 100 px";
        j = "resize grow height 100 px";
        k = "resize shrink height 100 px";
        l = "resize grow width 100 px";
      };
      keybindings = let 
        mod = "Mod4";
        rofi = "rofi -show drun -drun-display-format {name}";
        term = "kitty";
        browser = "qutebrowser";
      in {
        "${mod}+Return" = "exec ${term}";
        "${mod}+d" = "exec ${rofi}";
        "${mod}+b" = "exec ${browser}";
        "${mod}+s" = "exec grim -t png -g \"$(slurp)\" ~/$(date +%Y-%m-%d_%H-%m-%s).png";
        "${mod}+Shift+s" = "exec ~/nixdots/home/elric/pkgs/kitty/sessions/screenrecord.sh";

        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+c" = "reload";

        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        # Window management
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left 50px";
        "${mod}+Shift+j" = "move down 50px";
        "${mod}+Shift+k" = "move up 50px";
        "${mod}+Shift+l" = "move right 50px";

        # Handling workspaces
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # Layout
        "${mod}+c" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+r" = "mode \"resize\"";

        "${mod}+f" = "fullscreen";
        "${mod}+space" = "floating toggle";

        "XF86AudioRaiseVolume" = "exec pamixer --increase 5";
        "XF86AudioLowerVolume" = "exec pamixer --decrease 5";
        "XF86AudioMute" = "exec pamixer -t";

        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" =  "exec brightnessctl set 5%+";

        "F9"  = "exec playerctl --player=spotify previous";
        "F10" = "exec playerctl --player=spotify play-pause";
        "F11" = "exec playerctl --player=spotify next";
      };
    };
    extraConfig = "
      default_border pixel 3\n
      for_window [class=\".*\"] opacity 0.90\n
      for_window [app_id=\".*\"] opacity 0.90\n
      for_window [app_id=\"floating\"] floating enable, resize set 1000 600\n
      for_window [app_id=\"password\"] floating enable, resize set 400 50\n
      for_window [class=\"pico8\"] floating enable, resize set 600 600\n
      for_window [app_id=\"screenrecord\"] floating enable, resize set 50 50, move 10px 10px\n

      layer_effects \"rofi\" blur enable; blur_ignore_transparent enable; corner_radius 10\n
      layer_effects \"notifications\" blur enable; blur_ignore_transparent enable; corner_radius 10\n
      layer_effects \"gtk-layer-shell\" blur enable; blur_ignore_transparent enable; corner_radius 10\n

      shadows on\n
      shadow_offset 0 0\n
      shadow_blur_radius 20\n
      shadow_color #000000BB\n

      blur enable\n
      blur_radius 9\n
      blur_noise 0.1\n
      corner_radius 10\n
    ";
  };
}
