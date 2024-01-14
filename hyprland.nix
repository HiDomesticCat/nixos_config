
#cliphist
#dunst
#hyprland
#hyprpaper
#libinput
#unzip
#udiskie
#waybar
#wofi
#xwayland
#xdg-desktop-portal-hyprland
#xdg-desktop-portal-gtk
#xfce.thunar
#zip

{ config, pkgs, lib, ... }:
{
	# Window manager for Hyprland
	programs.hyprland.enable = true;
	programs.waybar.enable = true;
	programs.hyprland.xwayland = {
		enable = true;
	};
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
	# UI font
	fonts = {
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
			font-awesome
			source-han-sans
			open-sans
			nerdfonts
		];
		fontconfig.defaultFonts = {
			serif = ["Noto Serif" "Source Han Serif"];
			sansSerif = ["Open Sans" "Source Han Sans"];
			emoji = ["Nerdfonts"];
		};
	};
	# Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;
	services.dbus.enable = true;
}
