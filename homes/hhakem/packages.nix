{ pkgs, config, inputs, ...}:

{

  home.packages = with pkgs; [
    tldr # useful use cases for libs
    git
    killall
    gawk
    gnused # The one and only sed
    wget # fetch stuff
    killall # kill all the processes by name
    screen # ssh in and out of a server

    python310 # the standard python
];
  programs.git = {
    enable = true;
    userName = "HugoHakem";
    userEmail = "hugo.hakem@berkeley.edu";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
