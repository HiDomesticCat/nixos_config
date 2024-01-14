# Kernel comonents configuration.
# This configuration have Hyprland (window manager), TLP ...etc

{ config, pkgs, lib, ... }:
{
	# Charging management system
	powerManagement.enable = true;
	services.power-profiles-daemon.enable = false;
	services.thermald.enable = true;
	services.tlp = {
		enable = true;
		settings = {
			# Selects the CPU scaling governor.
			CPU_SCALING_GOVERNOR_ON_AC = "powersave";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			# Set CPU energy/performance policies
			CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
			CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

			# Define the min/max P-state for intel CPUs.
			CPU_MIN_PERF_ON_AC = 0;
			CPU_MAX_PERF_ON_AC = 100;
			CPU_MIN_PERF_ON_BAT = 0;
			CPU_MAX_PERF_ON_BAT = 70;
			# Set battery charge thresholds for main/internal battery BAT0
			START_CHARGE_THRESH_BAT0 = 50;
			STOP_CHARGE_THRESH_BAT0 = 80;
			#START_CHARGE_THRESH_BAT1 = 50;
			#STOP_CHARGE_THRESH_BAT1 = 80;
		};
	};

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
	services.flatpak.enable = true;

	# sound setting
	nixpkgs.config.pulseaudio = true;
	hardware.enableAllFirmware = true;

	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-gtk
			fcitx5-chinese-addons
			fcitx5-chewing
		];
	};

	environment.systemPackages = with pkgs; [
		brightnessctl
 		chezmoi
		clang-tools
		gedit
		git
		libreoffice
		libsForQt5.ark
		neovim
		onlyoffice-bin
		rustc
	];
	programs.kdeconnect.enable = true;
}
