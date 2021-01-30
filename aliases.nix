{
  # Rebindings
    ls = "colorls";
    la = "colorls -a";
  
  # shorten system update, upgrades, and garbage collection
    nixos-swtich = "sudo nixos-rebuild switch";
    home-switch = "home-manager switch";
    collect-garbage = "nix-collect-garbage";

  # Quick editing
    home-edit = "vim ~/.config/nixpkgs/home.nix";
    alias-edit = "vim ~/.config/nixpkgs/aliases.nix";
    config-edit = "sudo vim ~/.config/nixpkgs/configuration.nix";
    install-edit = "vim ~/.config/nixpkgs/install.sh";

  # Doom Aliases
    doom-sync = "bash .emacs.d/bin/doom sync";
    doom-upgrade = "bash .emacs.d/bin/doom upgrade";
    doom-doc = "bash .emacs.d/bin/doom doctor";
    doom-purge = "bash .emacs.d/bin/doom purge";
    doom-clean = "bash .emacs.d/bin/doom clean";
}
