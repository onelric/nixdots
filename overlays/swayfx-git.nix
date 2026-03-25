final: prev:

{
  swayfx = prev.swayfx.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "WillPower3309";
      repo = "swayfx";
      rev = "master";
      hash = "sha256-4A4DEMDxJgPbbszLVdnlhFsvQS73X91dANZN0wbrX6g=";
    };
  });
}
