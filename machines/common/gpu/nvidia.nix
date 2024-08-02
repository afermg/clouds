{ pkgs, config, ...}:
{

  hardware = {
    # Enable OpenGL
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
      ];
    };

    # Configure Nvidia driver
    nvidia = {

      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    nvidia-container-toolkit.enable = true;
  };

  # Nvidia and Cuda support
  services.xserver.videoDrivers = ["nvidia"];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;
}
