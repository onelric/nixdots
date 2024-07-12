{
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ../../pkgs/rofi
    ../../pkgs/waybar
    ../../pkgs/eww
    ../../pkgs/kitty
  ];

  home.packages = with pkgs; [
    swayfx
    rofi-wayland
    waybar
    eww

    spotify
    discord
    kitty
    brave

    wf-recorder
    wl-clipboard
    grim
    slurp

    brightnessctl
    playerctl
    pamixer
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
          background = "~/.local/share/wallpapers/wallhaven-859q1_cropj.jpg fill";
        };
      };
      bars = [];
      gaps = {
        inner = 10;
        outer = 10;
      };
      colors = {
        focused = {
          border = "#b66467";
          background = "#b66467";
          childBorder = "#b66467";
          indicator = "#b66467";
          text = "#b66467";
        };
        focusedInactive = {
          border = "#303030";
          background = "#303030";
          childBorder = "#303030";
          indicator = "#303030";
          text = "#303030";
        };
        unfocused = {
          border = "#101010";
          background = "#101010";
          childBorder = "#101010";
          indicator = "#101010";
          text = "#101010";
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
        { command = "waybar"; }
        { command = "eww daemon"; }
      ];
      modes.resize = {
        Escape = "mode default";
        Return = "mode default";
        h = "resize shrink width 50 px";
        j = "resize grow height 50 px";
        k = "resize shrink height 50 px";
        l = "resize grow width 50 px";
      };
      keybindings = let 
        mod = "Mod4";
        rofi = "rofi -show drun -drun-display-format {name}";
        term = "kitty";
      in {
        "${mod}+Return" = "exec ${term}";
        "${mod}+d" = "exec ${rofi}";
        "${mod}+s" = "exec grim -t png -g \"$(slurp)\" ~/$(date +%Y-%m-%d_%H-%m-%s).png";
        "${mod}+Shift+s" = "exec ~/.config/home-manager/pkgs/kitty/sessions/screenrecord.sh";

        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+c" = "reload";

        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        # Window management
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left 20px";
        "${mod}+Shift+j" = "move down 20px";
        "${mod}+Shift+k" = "move up 20px";
        "${mod}+Shift+l" = "move right 20px";

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
        "XF86AudioMute" = "exec pamixer --mute";

        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" =  "exec brightnessctl set 5%+";
      };
    };
    extraConfig = "
      default_border pixel 3
      for_window [class=\".*\"] opacity 0.90\n
      for_window [app_id=\".*\"] opacity 0.90\n
      for_window [app_id=\"floating\"] floating enable, resize set 1000 600\n
      for_window [app_id=\"password\"] floating enable, resize set 400 50\n
      for_window [app_id=\"screenrecord\"] floating enable, resize set 50 50, move 10px 10px\n

      shadows on\n
      shadow_offset 0 0\n
      shadow_blur_radius 20\n
      shadow_color #000000BB\n


      blur enable\n
      blur_radius 9\n
      blur_noise 0.1\n
      corner_radius 15\n
    ";
  };
}
