{ config, fetchurl, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./x1c.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
    };

    packageOverrides = pkgs: {
      neovim = pkgs.neovim.override {
        vimAlias = true;
      };

      weechat = pkgs.weechat.override {
        extraBuildInputs = [ pkgs.python27Packages.websocket_client ];
      };
    };
  };

	boot = {
		loader = {
			grub.enable = true;
			grub.version = 2;
			grub.device = "/dev/sda1";
		};
		kernelPackages = pkgs.linuxPackages_4_10;
	};
#  boot.kernelParams = [ "intel_pstate=no_hwp" ];
#  boot.loader = {
#    systemd-boot.enable = true;
#    efi.canTouchEfiVariables = true;
#  };

  fileSystems."/".device = pkgs.lib.mkForce "/dev/mapper/root";

  hardware.pulseaudio.enable = true;

  environment.sessionVariables = {
    GOPATH="/home/erik/go";
    PATH="$PATH:/home/erik/go/bin";
  };

  networking = {
    hostName = "nixos";
    wireless.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Stockholm";

  programs.fish.enable = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    arandr
    atool
    bar-xft
    bc
    beets
    cabal2nix
    calc
    chromium
    cifs_utils
    cmus
    evince
    firefox
    flac
    fortune
    gcc
    git
    gnumake
    httpie
    neovim
    ntfs3g
    p7zip
    pass
    pavucontrol
    pciutils
    pgadmin
    powertop
    ranger
    rofi
    rxvt_unicode
    samba
    sqlite
    scrot
    silver-searcher
    stow
    xfce.thunar
    transmission_gtk
    unrar
    unzip
    vlc
    weechat
    wget
    which
    xautolock
    xclip
    xfontsel
    xlockmore
    xorg.xmodmap
    xorg.xkill
    xorg.xdpyinfo

    elementary-icon-theme

    boot
    bundix
    elixir
    go
    guile
    jq
    leiningen
    nodejs
    stack
    racket

    haskellPackages.ghc-mod

    python27Packages.docker_compose
  ];

  services.redshift = {
    enable = true;
    latitude = "59.0";
    longitude = "18.0";
  };

  services.syncthing = {
    enable = true;
    user = "erik";
    dataDir = "/home/erik/.syncthing";
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "ctrl:nocaps";

    windowManager.xmonad.enable = true;
    windowManager.xmonad.extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.utf8-string
    ];

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";

    displayManager.sessionCommands = ''
      xrandr --dpi 180
      xsetroot -solid "#002b36"
      xsetroot -cursor_name left_ptr
      xautolock -time 15 -detectsleep -corners 000- -locker xlock &
      ssh-add
    '';
  };

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      corefonts
      fantasque-sans-mono
      ubuntu_font_family
    ];
  };

  users.extraUsers.martin = {
    isNormalUser = true;
    home = "/home/martin";
    shell = "${pkgs.fish}/bin/fish";
    extraGroups = [ "wheel" "docker" ];
    uid = 1000;
  };

  users.extraGroups.vboxusers.members = [ "erik" ];

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}
