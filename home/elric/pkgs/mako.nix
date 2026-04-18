{ ... }: 
{
  services.mako = {
    enable = true;
    extraConfig = ''
      anchor=top-left
      max-visible=4
      default-timeout=5000
      max-icon-size=54

      font=Maple Mono NF 10

      background-color=#181818
      text-color=#e8e3e3

      border-color=#151515
      border-radius=8
      border-size=5

      padding=15

      [urgency=low]
      background-color=#181818
      border-color=#151515

      [urgency=normal]
      background-color=#181818
      border-color=#151515

      [urgency=high]
      background-color=#181818
      text-color=#e8e3e3
      border-color=#b66467
      default-timeout=10000
    '';
  };
}
