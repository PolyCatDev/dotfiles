{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vscodium
  ];
  
  home.file = {
    ".config/VSCodium/User/keybindings.json".source = ../dotfiles/codium/keybindings.json;
    ".config/VSCodium/User/settings.json".source = ../dotfiles/codium/settings.json;
  };
}
