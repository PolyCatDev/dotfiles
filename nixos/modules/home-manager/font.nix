{ config, pkgs, ... }:

{
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) 
  ];
}
