{ lib, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "apollo";
  boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
  };

  boot.initrd.availableKernelModules = [ "nvme" ];

  time = {
    timeZone = "America/Montevideo";
    hardwareClockInLocalTime = true;
  };

  networking.networkmanager.enable = lib.mkForce true;
  opt = {
    system.roles.workstation = true;
    hardware.profiles = [
      "cpu/amd"
      "gpu/nvidia/turing"
    ];

    # hardware = {
    #   nvidia.enable = true;
    #   displays."" = "1920x1080@144";
    # };

  };
}