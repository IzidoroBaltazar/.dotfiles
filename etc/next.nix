{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      grub.enable = true;
      grub.version = 2;
      grub.device = "/dev/sda";
    };
    kernelPackages = pkgs.linuxPackages_4_10;
  };

  networking = {
    hostName = "lambda-loli";
    networkmanager.enable = true;
  };
  
  powerManagement.enable = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/London";

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true; 

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };

    packageOverrides = pkgs: {
      neovim = pkgs.neovim.override {
        vimAlias = true;
      };

    weechat = pkgs.weechat.override {
      extraBuildInputs = [ pkgs.python27Packages.websocket_client ];
    };
  };

  environment = {
    shells = [
      "${pkgs.bash}/bin/bash"
      "${pkgs.zsh}/bin/zsh"
    ];
    variables = {
      BROWSER = pkgs.lib.mkOverride 0 "chromium";
      EDITOR = pkgs.lib.mkOverride 0 "vim";
    };
    systemPackages = with pkgs; [
      # $ nix-env -qaP | grep wget to find packages
      # vim
      tmux
      screen
      firefox
      git
      mosh
      zsh

      mutt
      gnupg
      gnupg1compat
      haskell

      gnumake
      elixir
      go

      #Networking
      wireshark-gtk
      nmap
      miniupnpc

      mpv
      mplayer
      neovim
      #python35Packages.mps-youtube
      gnumake
      screenfetch
      vagrant
      python
      python34
      python35
      chromium
      inkscape
      file
      sshuttle

      wine
      steam

      # vim_configurable

      nox
      #julia
      neovim
      (emacsWithPackages (with emacsPackagesNg; [
        evil undo-tree powerline-evil key-chord linum-relative ace-jump-mode
        use-package projectile magit
        company company-quickhelp company-nixos-options company-jedi
        flycheck flycheck-pos-tip flycheck-haskell
        yasnippet
        nixos-options nix-sandbox
        haskell-mode intero
        org hamlet-mode ruby
        # idris-mode
        auctex auctex-latexmk
        ess
        rust-mode
        python-mode cython-mode
      ]))

      (with pkgs.haskellPackages; [
        ((ghcWithPackages (self: with self; [ transformers
                                              mtl
                                              lens
                                            ]
                          )).override {
          withLLVM = true;
        })
        cabal-install
        stack

        cabal2nix
        ghc-core
        stylish-haskell
        hlint
        threadscope
        pointfree
        yesod-bin
        stylish-haskell
      ]);
      #(texLiveAggregationFun { paths = [ texLive texLiveExtra texLiveBeamer lmodern ]; })
    ];
  };

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = false;
    fonts = [
       pkgs.terminus_font
       pkgs.kochi-substitute-naga10
       pkgs.source-code-pro
    ];
  };
  
  programs = {
    bash = {
      enableCompletion = true;
    };
    ssh = {
      startAgent = true;
    };
  };

  virtualisation = {
    libvirtd.enable = false;
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";

      #displayManager.gdm.enable = true;
      desktopManager = {
        gnome3.enable = true;
        default = "gnome3";
      };
    };
    avahi = {
      enable = true;
      nssmdns = true;
    };
    tlp = {
      enable = true;
    };
    openssh = {
      enable = true;
    };
    redshift = {
      enable = true;

      # Cambridge
      latitude = "52.2053";
      longitude = "0.1218";
    };
  };

  hardware = {
    trackpoint.emulateWheel = true;

    # for steam
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;
  };

  users = {
    extraUsers.kragniz = {
      group = "users";
      extraGroups = [
        "wheel"
        "networkmanager"
        "libvirtd"
        "vboxusers"
        "dialout"
      ];
      home = "/home/kragniz";
      createHome = true;
      useDefaultShell = true;
      password = "hunter2";
      uid = 1000;
    };
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}
