{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF";
      package = pkgs.maple-mono-SC-NF;
      size = 10;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;

      background = "#151515";
      foreground = "#e8e3e3";
      color0  = "#151515";
      color8  = "#303030";
      color15 = "#303030";
      color7  = "#e8e3e3";
      color1  = "#b66467";
      color9  = "#b66467";
      color2  = "#8c977d";
      color10 = "#8c977d";
      color3  = "#d9bc8c";
      color11 = "#d9bc8c";
      color4  = "#8da3b9";
      color12 = "#8da3b9";
      color5  = "#a988b0";
      color13 = "#a988b0";
      color6  = "#8aa6a2";
      color14 = "#8aa6a2";
    };
    keybindings = {
      "ctrl+plus" = "change_font_size all +0.5";
      "ctrl+minus" = "change_font_size all -0.5";
      "ctrl+0" = "change_font_size all 0";
    };
    extraConfig = "
      window_padding_width 8\n
      modify_font underline_position 3\n
      modify_font underline_thickness 200%
    ";
  };
}
