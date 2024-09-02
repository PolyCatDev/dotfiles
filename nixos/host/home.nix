{ config, pkgs, ... }:

{
  home.username = "polycat";
  home.homeDirectory = "/home/polycat";

  home.stateVersion = "24.05";
  
  imports = [
    ../modules/home-manager/gtk3.nix
     ../modules/home-manager/font.nix
    ../modules/home-manager/bash.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/add-codium.nix
    ../modules/home-manager/add-neovim.nix
    ../modules/home-manager/add-chirp.nix
  ];
  

  home.file = {
    ".vimrc".source = ../modules/dotfiles/.vimrc;
  };

  home.sessionVariables = {
     EDITOR = "vim";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
