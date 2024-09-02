{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lsd
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#default";
      rebuild-test = "sudo nixos-rebuild test --flake ~/.config/nixos#default";
      rebuild-upd = "sudo nixos-rebuild switch --recreate-lock-file --flake ~/.config/nixos#default";
      sys-flake-upd = "nix flake update ~/.config/nixos";
    };
  };
}
