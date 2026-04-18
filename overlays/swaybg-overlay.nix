final: prev: {
  swaybg = prev.swaybg.overrideAttrs (oldAttrs: {
    version = "pr-87"; # optional, just for clarity

    src = prev.fetchFromGitHub {
      owner = "swaywm";
      repo = "swaybg";
      rev = "refs/pull/87/head";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  });
}
