{ username, ... }:

{
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}/MAIN";
    configDir = "/home/${username}/.config/syncthing";

    settings = {
      devices = {
        "device1" = { id = "<device-id>"; };
      };
      folders = {
        "Obsidian" = {
          path = "/home/${username}/Obsidian";
          devices = [ "device1" ];
        };
      };
    };

    guiAddress = "127.0.0.1:3000";
  };

  # Optionally, enable firewall ports
  networking.firewall.allowedTCPPorts = [ 3000 ];

  # Ensure Syncthing restarts after configuration changes
  #systemd.services.syncthing.serviceConfig.Restart = "always";
}

