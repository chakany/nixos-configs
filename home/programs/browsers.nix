{ pkgs, lib, ... }: {
  programs.chromium = {
    enable = true;

    commandLineArgs = [
    	"--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
    ];
    package = pkgs.google-chrome;
  };
}
