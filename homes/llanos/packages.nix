{ pkgs, config, inputs, ...}:

{

  programs.git = {
    enable = true;
    userName = "Alan Munoz";
    userEmail = "afer.mg@gmail.com";
    #extraConfig = {
        # Sign all commits using ssh key
    #    commit.gpgsign = true;
    #    gpg.format = "ssh";
    #    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    #    user.signingkey = "~/.ssh/id_ed25519.pub";
    #  };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
