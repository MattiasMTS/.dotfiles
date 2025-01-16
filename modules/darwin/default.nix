{ pkgs, lib, config,... }:
let
  username = "mattiassjodin"; # TODO: fix as import instead
in 
{
  # yes it's I 
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  # system wide packages (all users)
  environment.systemPackages = with pkgs; [
    # TODO: uncomment later
    # brave
    # slack
    neovim
    git
    tmux
    gnumake
  ];

  # enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
  ];


  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # TODO: use overlays instead
  # whitelist unfree packages 
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "terraform"
    "raycast"
    "slack"
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # do garbage collection bi-daily to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 2d";
  };
}
