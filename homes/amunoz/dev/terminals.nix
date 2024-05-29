{ pkgs, ...}:
{
   home.packages = with pkgs; [
   wezterm
   kitty
   fish
   fishPlugins.async-prompt
   fishPlugins.pure
   fishPlugins.autopair
   ];
}
