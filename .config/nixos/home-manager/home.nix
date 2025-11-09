{ config, pkgs, ... }:

{
  home.username = "tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    tmux
    # kitty
    yt-dlp # mpv (requires swift for whatever reason)
    fzf
    unzip
    pass browserpass
    # uutils-coreutils-noprefix  # rust core utils 
    newsboat  # rss feed
    # texliveFull 
    # spotify-player
    syncthing
    # mplayer
    # ncmpcpp mpd
    just  # just run commands
    # (nerdfonts.override {
    #   fonts = [ "JetBrainsMono" "Hermit" "FiraCode" "ComicShannsMono" "Mononoki" ];
    # })
    starship  # shell prompt
    taplo pylint python312Packages.python-lsp-server marksman #lsp
    nil  # nix lsp i believe
    calcurse
    lf

    nerd-fonts.comic-shanns-mono

  ];


  programs = {
    # alacritty git gpg helix zsh

    alacritty = {
      enable = true;
    };

    git = {
      enable = true;
      settings.user.name = "Tean Lai";
      settings.user.email = "laitean19@gmail.com";
      # aliases = {
      #   pu = "push";
      #   co = "checkout";
      #   cm = "commit";
      # };
    };

    helix = {
      enable = true;
    };

  };



  programs.home-manager.enable = true;

}
