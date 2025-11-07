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
    zed-editor    # gui ide
    brave nyxt    # browsers
    obsidian discord
    pavucontrol
    blueberry bluetuith
    font-manager
    pinentry-curses 
    vlc
    osu-lazer
    kdePackages.dolphin       # gui file manager
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
    lf.enable = true;
    pywal.enable = true;
  };

  home.file = {
    # ".config/river/init".source = ../.config/river/init;
    # ".config/i3/config".source = ../.config/i3/config;
    # ".config/polybar" = { source = ../.config/polybar; recursive = true; };
  };


  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

}
