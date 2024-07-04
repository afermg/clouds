# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.home-manager.nixosModule
    inputs.nix-ld.nixosModules.nix-ld
    # outputs.nixosModules.sunshine
    # Import your generated (nixos-generate-config) hardware configuration

    # Disko configuration
    inputs.disko.nixosModules.disko
    ./disko.nix
    # Path to make boot work with zstore pool
    ./hardware-configuration.nix
    ./filesystem.nix

    # You can also split up your configuration and import pieces of it here:
    ../common/networking.nix
    ../common/printing.nix
    ../common/gpu/nvidia.nix
    ../common/substituters.nix
    ../common/pipewire.nix
    ../common/virtualization.nix
    ../common/input_device.nix
    ../common/ssh.nix
    ../common/us_eng.nix
    ../common/zfs.nix
  ];

  # FHS
  programs.nix-ld.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
  # Enable the GNOME Desktop Environment.
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };

  nixpkgs = {
    # You can add overlays here
    overlays = builtins.attrValues outputs.overlays;
    # Configure your nixpkgs instance
    config = {
      sunshine = {
        cudaSupport = true;
      };
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # Default system wide packages
  environment.systemPackages = with pkgs; [
      gnomeExtensions.forge
      gnomeExtensions.appindicator
  ];
  environment.shells = [ pkgs.zsh pkgs.fish ];
  programs.zsh.enable = true;
  programs.fish.enable = true;

  # Networking
  networking.hostName = "gpa85-cad";
  networking.hostId = "5a08e8de";
  # networking.bridges.br0.interfaces = [ "enp2s0" "wlp131s0" ];
  services.tailscale.enable = true;
  services.syncthing.enable = true;

  services.emacs = {
    enable = true;
    package = (pkgs.emacs29.override { withImageMagick = true; });
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amunoz = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "password";
    description = "Alan Munoz";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "input"];
    openssh.authorizedKeys.keyFiles = [
      ../../homes/amunoz/network/pub/id_rsa.pub
      ../../homes/amunoz/network/pub/dgx.pub
      ../../homes/amunoz/network/pub/main.pub
    ];
  };

  users.users.llanos = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Paula Llanos";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "input"];
    openssh.authorizedKeys.keyFiles = [
      ../../homes/llanos/id_rsa.pub
    ];
  };

  users.users.hhakem = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Hugo Hakem";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "input"];
    openssh.authorizedKeys.keyFiles = [
      ../../homes/hhakem/id_rsa.pub
    ];
  };

  # Enable home-manager for users
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };


  # USER HOMES
  home-manager.users.amunoz = {
    imports = [
     inputs.agenix.homeManagerModules.default
     ../../homes/amunoz/moby.nix
    ];
  };

  home-manager.users.llanos = {
    imports = [
     inputs.agenix.homeManagerModules.default
     ../../homes/llanos/moby.nix
    ];
  };

  home-manager.users.hhakem = {
    imports = [
     inputs.agenix.homeManagerModules.default
     ../../homes/hhakem/moby.nix
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
