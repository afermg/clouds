{ outputs, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };

  home.username = "amunoz";
  home.homeDirectory = "/home/amunoz";

  home.stateVersion = "24.05";

  dconf.settings = {
  "org/gnome/settings-daemon/plugins/power" = {
    sleep-inactive-ac-type = "nothing";
    };
   "org/gnome/desktop/input-sources" = {
        xkb-options = ["caps:swapescape"];
      };
    "org/gnome/shell".enabled-extensions = [
      "forge@jmmaranan.com"
      "appindicatorsupport@rgcjonas.gmail.com"
    ];
      # Custom keybindings
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = "disabled";
        # toggle-message-tray = "disabled";
        minimize = [];
        move-to-monitor-left=[];
        move-to-monitor-right=[];
        hide-window=[];
        close = ["<Super>q"];
        move-to-workspace-1=["<Shift><Super>1"];
        move-to-workspace-2=["<Shift><Super>2"];
        move-to-workspace-3=["<Shift><Super>3"];
        move-to-workspace-4=["<Shift><Super>4"];
        move-to-workspace-left=["<Control><Shift><Super>h"];
        move-to-workspace-right=["<Control><Shift><Super>l"];
        switch-to-workspace-1=["<Super>1"];
        switch-to-workspace-2=["<Super>2"];
        switch-to-workspace-3=["<Super>3"];
        switch-to-workspace-4=["<Super>4"];
        switch-to-workspace-left=["<Shift><Control>h"];
        switch-to-workspace-right=["<Shift><Control>l"];
      };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return"; # conflicts with forge, see  https://github.com/forge-ext/forge/issues/37
          # binding = "<Super>t";
          command = "/usr/bin/env kitty";
          name = "Terminal";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          binding = "<Super>e";
          command = "/usr/bin/env emacsclient -c -a emacs";
          name = "Emacs";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          binding = "<Super><Shift>Return";
          command = "firefox";
          name = "Emacs";
        };
        "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
  };
  programs.home-manager.enable = true;
}
