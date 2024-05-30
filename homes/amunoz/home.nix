{ outputs, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };

  home.username = "amunoz";
  home.homeDirectory = "/home/amunoz";

  home.stateVersion = "23.11";

  dconf.settings = {
#    "org/gnome/desktop/background" = {
#      picture-uri = "${./gui/wallpapers/gruvbox_astro.jpg}";
#      picture-uri-dark = "${./gui/wallpapers/gruvbox_astro.jpg}";
#      picture-options = "zoom";
#    };
   "org/gnome/desktop/input-sources" = {
        xkb-options = ["caps:swapescape"];
      };
    "org/gnome/shell".enabled-extensions = [
#      "blur-my-shell@aunetx"
#      "burn-my-windows@schneegans.github.com"
      "forge@jmmaranan.com"
      "appindicatorsupport@rgcjonas.gmail.com"
    ];
  };
  programs.home-manager.enable = true;
  # Warning: not working. See
  # https://github.com/nix-community/home-manager/issues/4841
  # for details
  # home.keyboard.options = ["caps:swapescape"];
}
