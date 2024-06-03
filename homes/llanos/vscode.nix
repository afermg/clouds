{ config, lib, pkgs, ... }:

{
  inputs.vscode-server.url = "github:nix-community/nixos-vscode-server";

  outputs = { self, nixpkgs, vscode-server }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      modules = [
        # This will import the NixOS or HM module depending on whether this is added to a NixOS or HM configuration.
        vscode-server.nixosModules.default
        # Or if you want to be explicit about it for some reason:
        # vscode-server.nixosModules.nixos
        # vscode-server.nixosModules.home
        {
          services.vscode-server.enable = true;
        }
      ];
    };
  };
}
