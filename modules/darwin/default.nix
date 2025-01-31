{ pkgs, lib, config, ... }:
let username = "mattiassjodin"; # TODO: fix as import instead
in {

  # yes it's I 
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  # system wide packages (all users)
  environment.systemPackages = with pkgs; [
    # TODO: uncomment later
    # brave
    # slack
    raycast # unfree license
    neovim
    git
    tmux
    gnumake
    postgresql_16
    nixfmt-classic # consider moving to nixfmt-rfc-style later
  ];

  homebrew = {
    enable = true;
    # some weird gvpx issue installing using home-manager..
    brews = [ "podman" "podman-compose" ];
    # casks = [ "brave" ];
  };

  # enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  fonts.packages = with pkgs.nerd-fonts; [ jetbrains-mono ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # TODO: use overlays instead
  # whitelist unfree packages 
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "terraform" "raycast" "slack" ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # do garbage collection bi-daily to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 2d";
  };
}
