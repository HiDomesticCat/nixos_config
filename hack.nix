{config, pkgs, lib, ...}:
{
	environment.systemPackages = with pkgs; [
		radare2
		nmap
		ghidra
		wireshark
		burpsuite
		metasploit
		zap
		gdb
	];
}
