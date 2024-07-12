{ ... }: {
  home.file = {
    ".config/waybar/style.css".source = ./style.css;
    ".config/waybar/config.jsonc".source = ./config.jsonc;
  };
}
