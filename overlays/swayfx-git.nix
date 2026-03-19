final: prev:

{
  swayfx = prev.swayfx.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "WillPower3309";
      repo = "swayfx";
      rev = "master";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  });
}
