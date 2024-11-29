{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "PolyCat";
    userEmail = "contact.polycat@proton.me";

    # Set up Git configuration files
    #home.file.".gitconfig".source = ../../gitconfig;
    #home.file.".gitignore".source = ../../gitignore;
  };
}
