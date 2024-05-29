{ config, ... }:
{
 # home.file.".ssh/allowed_signers".text =
 #  "* ${builtins.readFile ../id_ed25519.pub}";
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
}
