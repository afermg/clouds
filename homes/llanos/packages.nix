{ pkgs, config, inputs, ...}:

{

  programs.git = {
    enable = true;
    userName = "PaulaLlanos";
    userEmail = "llanos.paula@gmail.com";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
