{ config, pkgs, ... }:
{
	home.username = "naman";
	home.homeDirectory = "/home/naman";
	home.stateVersion = "26.05";

	home.file.".config/hypr".source = ./config/hypr;
	home.file.".config/foot".source = ./config/foot;
	home.file.".config/tofi".source = ./config/tofi;
	home.file.".config/quickshell".source = ./config/quickshell;
	home.file.".config/nvim".source = ./config/nvim;
	home.file.".config/cava".source = ./config/cava;
	
	programs.zsh = {
	    enable = true;
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;
	    profileExtra = ''
		if [ "$(tty)" = "/dev/tty1" ]; then
			exec start-hyprland
		fi
	    '';
	};

	programs.starship = {
    		enable = true;
    		enableZshIntegration = true;
	};

	programs.git = {
    enable = true;

    settings = {
        user = {
            name = "Naman Arora";
            email = "namanarora1022@gmail.com";
        };
        init.defaultBranch = "master";
    };
  };



  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark-Cursors";
    size = 24;
  };


	home.packages = with pkgs; [
    		zsh
    		starship
        ];

}
