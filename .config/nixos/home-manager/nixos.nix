{ config, pkgs, ... }:

{
  home.username = "tean";
  home.homeDirectory = "/home/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # wayland stuff
    niri          # waland      compositor
    # river rofi-wayland swaybg libnotify wlr-randr waybar #  mako # wayland
    # hyprpaper libnotify dunst rofi egl-wayland mangohud wl-clipboard
    fuzzel        # wayland     app launcher
    swaylock      # wayland     screen locker
    wl-clipboard  # wayland     clipboard
    waybar        # wayland     info bar
    dunst         # x11/wayland notifications daemon
    # mako          # wayland notifications daemon?

    # x11 stuff
    libnotify feh dmenu polybar xclip

    # foot
    kakoune
    zed-editor    # gui ide
    brave nyxt firefox   # browsers
    lxappearance  # gtk theming
    obsidian discord spotify
    pavucontrol   # audio control
    blueberry bluetuith
    font-manager
    pinentry-curses
    vlc
    osu-lazer
    kdePackages.dolphin       # gui file manager
    gopass gopass-jsonapi  # password manager
    just  # just a command runner
    appimage-run

    nixd

    iverilog verilator verible gtkwave

    tmux yt-dlp fzf unzip
    htop

    pass browserpass
    newsboat
    syncthing
    mplayer ncmpcpp mpd
    just
    lf
    nerd-fonts.comic-shanns-mono

    ollama cargo libgcc
    opam

    snore

    sshfs
  ];

  # xdg.portal = {
  #   enable = true;
  #   # backends that provide the file picker
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #   # apparently this steers the chooser to GTK
  #   config = {
  #     common = {
  #       default = [ "*" ];
  #       "org.freedesktop.impl.portal.FileChooser" = "gtk";
  #     };
  #   };
  # };

  programs = {
    alacritty.enable = true;
    lf.enable = true;
    pywal.enable = true;
    git = {
      enable = true;
      settings.user.name = "Tean Lai";
      settings.user.email = "laitean19@gmail.com";
    };
    fish = {
      enable = true;
      plugins = [
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }  # colorize cmd output
      ];
    };


  };

  home.file = {
    # ".config/river/init".source = ../.config/river/init;
    # ".config/i3/config".source = ../.config/i3/config;
    # ".config/polybar" = { source = ../.config/polybar; recursive = true; };
  };


  gtk = {
    enable = true;
    # theme.name = "adw-gtk3";
    theme.name = "Adwaita-Dark";
    cursorTheme.name = "Bibata-Modern-Ice";
    # iconTheme.name = "GruvboxPlus";
  };

}
