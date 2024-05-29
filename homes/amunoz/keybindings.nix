{ pkgs, ... }
{
  services.xserver.desktopManager.gnome3 = {
    extraGSettingsOverridePackages = with pkgs; [ gnome3.gnome-settings-daemon ];
    extraGSettingsOverrides = ''
[org/gnome/desktop/wm/keybindings]
close=['<Super>q']
minimize=@as []
move-to-workspace-1=['<Shift><Super>1']
move-to-workspace-2=['<Shift><Super>2']
move-to-workspace-3=['<Shift><Super>3']
move-to-workspace-4=['<Shift><Super>4']
move-to-workspace-left=['<Shift><Super>h']
move-to-workspace-right=['<Shift><Super>l']
switch-to-workspace-1=['<Super>1']
switch-to-workspace-2=['<Super>2']
switch-to-workspace-3=['<Super>3']
switch-to-workspace-4=['<Super>4']
switch-to-workspace-left=['<Shift><Control>h']
switch-to-workspace-right=['<Shift><Control>l']
    '';
  };
}