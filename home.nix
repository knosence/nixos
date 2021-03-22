{ config, pkgs, libs, stdenv, ... }:

{


  home.packages = [
    pkgs.git
    pkgs.zoom-us
    pkgs.ark
    pkgs.chromium
    pkgs.brave
    pkgs.vlc
    pkgs.alacritty
    pkgs.etcher
    pkgs.docker
    pkgs.vscode
    pkgs.ledger-live-desktop
    pkgs.qemu_kvm
    pkgs.virt-manager-qt
    pkgs.joplin-desktop
    pkgs.cura_stable
    
  ];

  
  programs.home-manager.enable = true;
  programs.bat.enable = true;
  programs.git = {
    enable = true;
    userName = "NaDario M. Seays";
    userEmail = "nadario.seays@gmail.com";
    extraConfig = {
      hub.protocol = "https";
      github.user = "knosence";
      color.ui = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      url."https://github.com/Knosence/".insteadOf= [
        "git@github.com:Knosence/"
        "git@github.com:knosence/"
        "ssh://git@github.com:Knosence/"
        "ssh://git@github.com:knosence/"
      ];
    };
  };

  programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;    
      history = {
        path = ".local/share/zsh/.zsh_history";
        size = 50000;
        save = 50000;
      };
      shellAliases = import ./aliases.nix;
      defaultKeymap = "emacs";
     
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.3";
            sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
            sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
          };
        }
      ];

      sessionVariables = rec {
        NVIM_TUI_ENABLE_TRUE_COLOR = "1";

        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=3";
        DEV_ALLOW_ITERM2_INTEGRATION = "1";

        EDITOR = "vim";
        VISUAL = EDITOR;
        GIT_EDITOR = EDITOR;

      
      };
      # envExtra
      # profileExtra
      # loginExtra
      # logoutExtra
      # localVariables
    };
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./extraConfig.vim;

    plugins = with pkgs.vimPlugins; [
    vim-nix
    rust-vim
    vim-fish
    vim-toml
    vim-pandoc
    vim-pandoc-syntax
    
    gruvbox
    vim-gitgutter
    vim-devicons
    vim-airline
    
    vim-surround
    vim-repeat
    vim-commentary
    vim-indent-object
    vim-easy-align
    vim-sneak
    supertab
    ale
    nerdtree
    
    fzf-vim
    
    tagbar
    vim-fugitive
    ];
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "knosence";
  home.homeDirectory = "/home/knosence";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./emacs.nix
  ];
  

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}

