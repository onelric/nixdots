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

      background-color=#181818DD
      text-color=#e8e3e3

      border-color=#151515DD
      border-radius=8
      border-size=5

      padding=15

      [urgency=low]
      background-color=#181818DD
      border-color=#151515DD

      [urgency=normal]
      background-color=#181818DD
      border-color=#151515DD

      [urgency=high]
      background-color=#181818DD
      text-color=#e8e3e3
      border-color=#b66467DD
      default-timeout=10000
    '';
  };
}
