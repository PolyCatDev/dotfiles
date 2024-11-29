{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;

    cursorTheme.package = pkgs.capitaine-cursors-themed;
    cursorTheme.name = "Capitaine Cursors";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3-dark";

    iconTheme.package = pkgs.tela-circle-icon-theme;
    iconTheme.name = "Tela-circle";
  };
  
  home.activation.removeGTK4Theming = lib.hm.dag.entryAfter ["writeBoundary"] ''rm ${config.xdg.configHome}/gtk-4.0/gtk.css'';
  #home.file."${config.xdg.configHome}/gtk-4.0/gtk.css".text = ''${extraCss}'';
}
