{ config, pkgs, lib, ... }:
{
	services.xserver.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.desktopManager.xfce.enable = true;
	services.power-profiles-daemon.enable = false;
	
	qt = {
		enable = true;
		platformTheme = "gnome";
		style = "adwaita-dark";
	};
}
