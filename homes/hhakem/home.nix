{ outputs, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };

  home.username = "hakem";
  home.homeDirectory = "/home/hakem";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
