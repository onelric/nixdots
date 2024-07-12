{ lib, pkgs, ... }:

let 
  aliases = {
    v = "nvim";
    y = "yazi";
    cat = "bat --theme=base16";

    ls  = "eza $eza_params";
    l   = "eza --git-ignore $eza_params";
    ll  = "eza --all --header --long $eza_params";
    llm = "eza --all --header --long --sort=modified $eza_params";
    la  = "eza -lbhHigUmuSa";
    lx  = "eza -lbhHigUmuSa@";
    lt  = "eza --tree $eza_params";

    tree = "eza --tree $eza_params";
    gitkey = "wl-copy < ~/.gitkey";
    push = "gitkey ; git push";

    dog = "echo 'cat'";

    home = "nvim ~/.config/home-manager/";
  };
in
{
  programs.zsh = {
    enable = lib.mkDefault true;
    shellAliases = aliases;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
       enable = true;
       theme = "eastwood";
       plugins = [
         "git"
         "vi-mode"
       ];
    };
    initExtra = "
      export PATH=/home/elric/.cargo/bin/:$PATH\n
      export XDG_RUNTIME_DIR=/run/user/$(id -u)\n
      bindkey -M viins 'kj' vi-cmd-mode\n
      bindkey -M viins 'jk' vi-cmd-mode\n
      VI_MODE_SET_CURSOR=true\n
      catnip -s'~>' -c 'blue,red,yellow,green'\n
    ";
  };

  home.packages = with pkgs; [
    bat eza fzf
  ];
}
