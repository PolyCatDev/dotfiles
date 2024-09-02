{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    chirp
  ];
  
  home.file = {
    ".local/share/applications/chirp.desktop".source = ../dotfiles/chirp.desktop;
  };
}
